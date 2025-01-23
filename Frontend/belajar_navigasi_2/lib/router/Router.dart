import 'package:belajar_navigasi_2/pages/Detailpage.dart';
import 'package:belajar_navigasi_2/pages/Homepage.dart';
import 'package:belajar_navigasi_2/pages/Loginpage.dart';
import 'package:belajar_navigasi_2/pages/PageContainer.dart';
import 'package:belajar_navigasi_2/pages/Productpage.dart';
import 'package:belajar_navigasi_2/pages/Profilepage.dart';
import 'package:belajar_navigasi_2/pages/Registerpage.dart';
import 'package:belajar_navigasi_2/pages/Settingpage.dart';
import 'package:belajar_navigasi_2/provider/AuthProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: "login",
        path: '/',
        builder: (context, state) => Loginpage(),
      ),
      GoRoute(
        name: "register",
        path: '/register',
        builder: (context, state) {
          return Registerpage();
        },
      ),
      ShellRoute(
        routes: [
          GoRoute(
              path: '/home',
              builder: (context, state) => Homepage(),
              routes: [
                GoRoute(
                    path: '/product',
                    builder: (context, state) => Productpage(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        builder: (context, state) {
                          final id = state.pathParameters['id']!;
                          return Detailpage(id: id);
                        },
                      )
                    ])
              ]),
          GoRoute(
            path: '/profile',
            builder: (context, state) => Profilepage(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => Settingpage(),
          ),
        ],
        builder: (context, state, child) {
          return Pagecontainer(child: child);
        },
      )
    ],
    redirect: (context, state) {
      final isAuth =
          Provider.of<Authprovider>(context, listen: false).getAuthStatus();
      if (!isAuth && state.matchedLocation != '/register') {
        return '/';
      }

      return null;
    },
  );
}
