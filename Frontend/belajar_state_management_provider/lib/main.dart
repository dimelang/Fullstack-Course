import 'package:belajar_state_management_provider/pages/Homepage.dart';
import 'package:belajar_state_management_provider/providers/Counter.dart';
import 'package:belajar_state_management_provider/providers/ThemeChanger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return Counter();
        },
      ),
      ChangeNotifierProvider(
        create: (context) {
          return Themechanger();
        },
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<Themechanger>(context, listen: true).themeIsLight()
            ? ThemeData.light()
            : ThemeData.dark(),
        home: Homepage());
  }
}
