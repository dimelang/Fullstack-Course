import 'package:flutter/material.dart';

class Desktopwidget extends StatelessWidget {
  const Desktopwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  "Navbar",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Expanded(
              flex: 12,
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      child: Text(
                        'Sidebar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      spacing: 10,
                      children: [
                        Expanded(
                            flex: 4,
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.orange,
                              child: Text(
                                'Main',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                color: Colors.pink,
                                child: Text(
                                  "Content 1",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                color: Colors.pink,
                                child: Text(
                                  "Content 2",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                              Expanded(
                                  child: Container(
                                alignment: Alignment.center,
                                color: Colors.pink,
                                child: Text(
                                  "Content 3",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              color: Colors.deepPurple,
                              child: Text(
                                'Footer',
                                style: TextStyle(color: Colors.white),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
