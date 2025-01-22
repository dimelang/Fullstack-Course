import 'package:belajar_http_dan_local_storage/pages/404page.dart';
import 'package:belajar_http_dan_local_storage/pages/Homepage.dart';
import 'package:belajar_http_dan_local_storage/pages/Loginpage.dart';
import 'package:belajar_http_dan_local_storage/pages/Registerpage.dart';
import 'package:belajar_http_dan_local_storage/provider/LoginStatusProvider.dart';
import 'package:belajar_http_dan_local_storage/provider/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          final loginProvider = Loginstatusprovider();
          loginProvider.loadLoginStatus();
          return loginProvider;
        },
      ),
      ChangeNotifierProvider(
        create: (context) {
          final userProvider = Userprovider();
          userProvider.loadUserFromPrefs();
          return userProvider;
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter http and local storage demo',
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        final loginStatus =
            Provider.of<Loginstatusprovider>(context, listen: false);
        final userProvider = Provider.of<Userprovider>(context, listen: false);

        if (settings.name == '/home' && !loginStatus.loginStatus()) {
          return MaterialPageRoute(
            builder: (context) {
              return Loginpage();
            },
          );
        }

        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(
              builder: (context) {
                return Loginpage();
              },
            );
          case '/register':
            return MaterialPageRoute(
              builder: (context) {
                return Registerpage();
              },
            );
          case '/home':
            return MaterialPageRoute(
              builder: (context) {
                return Homepage();
              },
            );
          default:
            return MaterialPageRoute(
              builder: (context) {
                return NotFoundPage();
              },
            );
        }
      },
    );
  }
}
