import 'package:e_commerce_setup/config/theme.dart';
import 'package:e_commerce_setup/ui/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'generated/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en');
  bool _isDarkMode = false;
  bool _isWeekEye = false;

  void _toggleIsWeekEye() {
    setState(() {
      _isWeekEye = !_isWeekEye;
    });
  }

  void _toggleLanguage() {
    setState(() {
      if (_locale.languageCode == 'en') {
        _locale = Locale('ru');
      } else {
        _locale = Locale('en');
      }
    });
  }

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme.copyWith(
        textTheme: lightTheme.textTheme.copyWith(
          bodyLarge: TextStyle(
            fontSize: _isWeekEye ? 30.0 : 24.0, // Динамический размер шрифта
          ),
        ),
      ),
      darkTheme: darkTheme.copyWith(
        textTheme: darkTheme.textTheme.copyWith(
          bodyLarge: TextStyle(
            fontSize: _isWeekEye ? 30.0 : 24.0, // Динамический размер шрифта
          ),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      locale: _locale,
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('ru', ''), // Russian
      ],
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: MyHomePage(
        onToggleLanguage: _toggleLanguage,
        onToggleTheme: _toggleTheme,
        onToggleWeekEye: _toggleIsWeekEye,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback onToggleLanguage;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleWeekEye;

  MyHomePage({
    required this.onToggleLanguage,
    required this.onToggleTheme,
    required this.onToggleWeekEye,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Все Text автоматически использует стиль из темы
            MyText(
              text: S.of(context).message, // Локализированное сообщение
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onToggleLanguage,
              child: MyText(
                text: 'Toggle Language',
              ),
            ),
            ElevatedButton(
              onPressed: onToggleTheme,
              child: MyText(text: 'Переключить тему'),
            ),
            ElevatedButton(
              onPressed: onToggleWeekEye,
              child: MyText(text: 'Change font size'),
            ),
          ],
        ),
      ),
    );
  }
}
