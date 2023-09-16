import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:viacep/pages/main_page.dart';
import 'package:viacep/services/theme_services.dart';
import 'package:viacep/shared/constants.dart';
import 'package:viacep/shared/layout/theme.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Constants.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeService().theme,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: const MainPage(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt'),
      ],
    );
  }
}
