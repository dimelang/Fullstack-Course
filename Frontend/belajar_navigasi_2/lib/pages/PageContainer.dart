import 'package:belajar_navigasi_2/helper/Helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Pagecontainer extends StatefulWidget {
  final Widget child;
  const Pagecontainer({super.key, required this.child});

  @override
  State<Pagecontainer> createState() => _PagecontainerState();
}

class _PagecontainerState extends State<Pagecontainer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Helper helper = Helper();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Apps Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(helper.colorFromHex('#2E5077')),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          switch (value) {
            case 0:
              context.go('/home');
              break;
            case 1:
              context.go('/profile');
              break;
            case 2:
              context.go('/settings');
              break;
            default:
          }
        },
      ),
    );
  }
}
