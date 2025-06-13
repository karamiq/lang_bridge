import 'package:lang_bridge/data/shared_preference/preferences.dart';
import 'package:lang_bridge/router/routing_animation.dart';
import 'package:lang_bridge/src/activities/pages/memory_game/memory_game_page.dart';
import 'package:lang_bridge/src/auth/login_page.dart';
import 'package:lang_bridge/src/auth/signup_page.dart';
import 'package:lang_bridge/src/daily/daily_page.dart';
import 'package:lang_bridge/src/entry_point/entry_point.dart';
import 'package:lang_bridge/src/learn/pages/phrases/phrase_page.dart';
import 'package:lang_bridge/src/activities/pages/quiz/quiz_page.dart';
import 'package:lang_bridge/src/learn/pages/stories/stories_page.dart';
import 'package:lang_bridge/src/learn/pages/word/category_page.dart';
import 'package:lang_bridge/src/learn/pages/word/word_page.dart';
import 'package:lang_bridge/src/profile/pages/achievements/achievements_page.dart';
import 'package:lang_bridge/src/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lang_bridge/src/landing/landing_page.dart';
import 'package:lang_bridge/src/landing/pages/language_selection.dart';
import 'package:lang_bridge/src/leaderboard/leaderboard_page.dart';
import 'package:lang_bridge/src/activities/activities_page.dart';
import 'package:lang_bridge/src/learn/learn_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Provider<GoRouter> routerProvider = Provider((ref) => router);

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

// GoRouter configuration
final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: RoutesDocument.learnWords, // Changed from RoutesDocument.learn
  navigatorKey: _rootNavigatorKey,
  redirect: (context, state) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final authenticationRaw = sharedPreferences.getString(Preferences.authentication);
    final isAuthenticated = authenticationRaw != null && authenticationRaw.isNotEmpty;

    final path = state.uri.path;

    final isLogin = path == RoutesDocument.login;
    final isSignup = path == RoutesDocument.signup;

    if (!isAuthenticated) {
      // Only allow login and signup pages
      if (!isLogin && !isSignup) {
        return RoutesDocument.login;
      }
      return null; // Stay on login/signup
    } else {
      // Prevent going back to login/signup
      if (isLogin || isSignup) {
        return RoutesDocument.learnWords;
      }
      return null; // Allow other authenticated pages
    }
  },
  routes: [
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.signup,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.landing,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: RoutesDocument.selectLanguage,
      builder: (context, state) => const LanguageSelectionPage(),
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return EntryPoint(child: child);
      },
      routes: <RouteBase>[
        ShellRoute(
          pageBuilder: (context, state, child) => instanTransition(state, LearnPage(child: child)),
          routes: [
            GoRoute(
              path: RoutesDocument.learnWords,
              pageBuilder: (context, state) => instanTransition(
                state,
                const WordsPage(),
              ),
              routes: [
                GoRoute(
                    path: '/:id',
                    name: '/:id',
                    pageBuilder: (context, state) => instanTransition(
                        state,
                        CategoryPage(
                          category: state.pathParameters['id']!,
                        ))),
              ],
            ),
            GoRoute(
              path: RoutesDocument.learnStories,
              pageBuilder: (context, state) => instanTransition(
                state,
                const StoriesPage(),
              ),
            ),
            GoRoute(
              path: RoutesDocument.learnPhrases,
              pageBuilder: (context, state) => instanTransition(
                state,
                const PhrasesPage(),
              ),
            ),
          ],
        ),
        GoRoute(
          path: RoutesDocument.dailyPhrases,
          pageBuilder: (context, state) => instanTransition(
            state,
            const DailyPage(),
          ),
        ),
        GoRoute(
          path: RoutesDocument.activities,
          pageBuilder: (context, state) => instanTransition(
            state,
            const ActivitiesPage(),
          ),
          routes: [
            GoRoute(
                path: RoutesDocument.memeoryGame,
                pageBuilder: (context, state) => instanTransition(
                      state,
                      const MemoryGamePage(),
                    )),
          ],
        ),
        GoRoute(
          path: RoutesDocument.leaderboard,
          pageBuilder: (context, state) => instanTransition(
            state,
            const LeaderboardPage(),
          ),
        ),
        GoRoute(
            path: RoutesDocument.profile,
            pageBuilder: (context, state) => instanTransition(
                  state,
                  const ProfilePage(),
                ),
            routes: []),
      ],
    ),
    GoRoute(
        path: '${RoutesDocument.profile}${RoutesDocument.achievements}',
        builder: (context, state) => const AchievementsPage()),
  ],
);

class RoutesDocument {
  const RoutesDocument._();
  static const String login = '/login';
  static const String signup = '/signup';
  static const String landing = '/landing';
  static const String selectLanguage = '/select-language';
  static const String activities = '/activities';
  static const String dailyPhrases = '/daily-phrases';
  static const String leaderboard = '/leaderboard';
  static const String profile = '/profile';
  static const String words = '/words';
  static const String quiz = '/quiz';
  static const String phrases = '/phrases';

  // Full paths for sub-routes
  static const String learnWords = '/learn/words';
  static const String learnStories = '/learn/stories';
  static const String learnPhrases = '/learn/phrases';

  static const String achievements = '/achievements';
  static const String memeoryGame = '/memory-game';

  static String learnWordsCategory(String id) => '/learn/words/$id';
}

// Usage example:
// To navigate to words page: context.go(RoutesDocument.learnWords);
// To navigate to quiz page: context.go(RoutesDocument.learnQuiz);
// To navigate to phrases page: context.go(RoutesDocument.learnPhrases);
