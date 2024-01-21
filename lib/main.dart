import 'package:expenses_flutter_app/Pages/expenses.home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      const MainPage(),
    ),
  );
}

ColorScheme myColorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
ColorScheme myDarkColorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Flutter Demo',
      theme: ThemeData().copyWith(
        colorScheme: myColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          shadowColor: myColorScheme.primaryContainer,
          elevation: 8,
          backgroundColor: myColorScheme.onPrimaryContainer,
          foregroundColor: myColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          shadowColor: Colors.grey,
          elevation: 20,
          color: myColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: myColorScheme.onPrimaryContainer,
            foregroundColor: Colors.white70,
            textStyle: const TextStyle(
              // color: Colors.white70,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        textTheme: const TextTheme().copyWith(
          // text in appbar using title large
          titleLarge: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: myColorScheme.onSecondaryContainer,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: myColorScheme.onSecondaryContainer,
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: myColorScheme.onSecondaryContainer,
          ),
        ),
      ),
      // darkTheme: ThemeData.dark().copyWith(
      //   colorScheme: myDarkColorScheme,
      //   appBarTheme: const AppBarTheme().copyWith(
      //     shadowColor: myColorScheme.primaryContainer,
      //     elevation: 8,
      //     backgroundColor: myColorScheme.onPrimaryContainer,
      //     foregroundColor: myColorScheme.primaryContainer,
      //   ),
      //   cardTheme: const CardTheme().copyWith(
      //     shadowColor: Colors.grey,
      //     elevation: 20,
      //     color: myDarkColorScheme.secondaryContainer,
      //     margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   ),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(5),
      //       ),
      //       backgroundColor: myDarkColorScheme.onPrimaryContainer,
      //       foregroundColor: Colors.white70,
      //       textStyle: const TextStyle(
      //         // color: Colors.white70,
      //         fontSize: 17,
      //         fontWeight: FontWeight.w700,
      //       ),
      //     ),
      //   ),
      //   textTheme: const TextTheme().copyWith(
      //     // text in appbar using title large
      //     titleLarge: TextStyle(
      //       fontSize: 25,
      //       fontWeight: FontWeight.w700,
      //       color: myDarkColorScheme.onSecondaryContainer,
      //     ),
      //     bodyMedium: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.bold,
      //       color: myDarkColorScheme.onSecondaryContainer,
      //     ),
      //     bodySmall: TextStyle(
      //       fontSize: 15,
      //       fontWeight: FontWeight.w400,
      //       color: myDarkColorScheme.onSecondaryContainer,
      //     ),
      //   ),
      // ),
      home: const ExpensesPage(),
    );
  }
}
