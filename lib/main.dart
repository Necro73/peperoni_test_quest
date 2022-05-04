import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:peperoni_test_quest/screens/main/main_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Color.fromARGB(255, 61, 61, 61),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),

        ///3D3D3D
      ),
      home: const MainScreen(),
    );
  }
}
