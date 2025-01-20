import 'package:belajar_navigasi_1/pages/Homepage.dart';
import 'package:belajar_navigasi_1/pages/Profilepage.dart';
import 'package:belajar_navigasi_1/pages/Seecondpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Homepage(
            title: "Homepage",
            content: Text(
              "Homepage Content",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          );
        },
        '/second-page': (context) {
          return Seecondpage(
            title: 'Seecondpage',
            content: Text(
              "Secondpage Content",
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          );
        },
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/profile':
            return MaterialPageRoute(
              builder: (context) {
                final args = settings.arguments as Map<String, dynamic>;
                return Profilepage(
                  title: args['title'],
                  id: args['id'],
                );
              },
            );
            break;
          default:
        }
      },
    );
  }
}
