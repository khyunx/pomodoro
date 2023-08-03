import 'package:pomodoro/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color(0xffE64D3D),
          ),
        ),
        cardColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: const Color.fromARGB(255, 45, 153, 225),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
