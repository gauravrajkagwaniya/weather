import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_flutter/presentation/custom/store_observer.dart';
import 'package:mobx_flutter/presentation/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobx_flutter/store/user_store.dart';
import 'package:mobx_flutter/store/weather_store.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>(create: (_) => UserStore()),
        Provider<WeatherStore>(create: (_) => WeatherStore()),
      ],
      child: StoreObserver(
        builder: (WeatherStore store ,context) {
          return MaterialApp(
            title: 'Weather task',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('de'),
            theme: ThemeData(
              brightness: Brightness.light,
              /* light theme settings */
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              /* dark theme settings */
            ),
            themeMode: store.isThemeDark ? ThemeMode.dark :ThemeMode.light,
            /* ThemeMode.system to follow system theme,
         ThemeMode.light for light theme,
         ThemeMode.dark for dark theme
      */
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
