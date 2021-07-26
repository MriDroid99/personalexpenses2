import 'package:flutter/material.dart';

// Screens
import 'screens/item_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(),
      home: ItemScreen(),
    );
  }
}
