import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food/home.dart';

var colorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181),);

var darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
      MyApp()
  );
  // });

}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    
      debugShowCheckedModeBanner: false,
      title: 'APP',
    
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
    
        appBarTheme: AppBarTheme(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
    
        cardTheme: CardTheme(
          color: colorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
    
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primaryContainer,
              foregroundColor: darkColorScheme.onPrimaryContainer,
            )
        ),
    
        textTheme: TextTheme(
            titleLarge: TextStyle(
              color: colorScheme.onSecondaryContainer,
              fontSize: 20,
            )
        ),
      ),
      themeMode: ThemeMode.light,
      home: homePage(),
    );
  }
}
