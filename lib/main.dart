import 'package:firebase_core/firebase_core.dart';
import 'package:lang_bridge/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lang_bridge/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'data/shared_preference/shared_preferences_lib.dart';

const String appName = 'LangBridge';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final sharedPreferences = await SharedPreferences.getInstance();

  timeago.setLocaleMessages('ar', timeago.ArMessages()); // Add french messages

  // HttpOverrides.global = MyHttpOverrides();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWith((ref) => sharedPreferences),
      ],
      child: const App(),
    ),
  );
}
