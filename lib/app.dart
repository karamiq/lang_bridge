import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/streak_provider.dart';
import 'package:lang_bridge/main.dart';
import 'package:lang_bridge/router/app_router.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/theme/app_theme.dart';
import 'package:lang_bridge/utils/extensions.dart';
import 'package:lang_bridge/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_kurdish_localization/kurdish_material_localization_delegate.dart';
// import 'package:flutter_kurdish_localization/kurdish_widget_localization_delegate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupUserListeners();
  }

  void _setupUserListeners() {
    WidgetsBinding.instance.scheduleFrameCallback((_) async {
      final user = ref.read(authenticationProvider);
      if (user != null) {
        final listener = UserListenerService(ref);
        listener.listenToUserDoc(user.uid);
        await listener.checkAndUpdateStreak(user.uid);
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _setupUserListeners();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme();
    final settings = ref.watch(settingsProvider);

    return MaterialApp.router(
      title: appName,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      scaffoldMessengerKey: Utils.messengerKey,
      locale: settings.locale,
      onGenerateTitle: (context) => context.l10n.appName,
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        // KurdishMaterialLocalizations.delegate,
        // KurdishWidgetLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      themeMode: settings.themeMode,
      darkTheme: theme.buildDarkTheme(),
      theme: theme.buildLightTheme(),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
