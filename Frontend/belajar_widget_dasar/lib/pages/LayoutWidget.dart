import 'dart:math';

import 'package:flutter/material.dart';

class Layoutwidget extends StatelessWidget {
  const Layoutwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                width: 320,
                height: 320,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Text("Container Widget"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.blueAccent,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.redAccent,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.greenAccent,
                      ),
                      Container(
                        width: 200,
                        height: 200,
                        color: Colors.amberAccent,
                      ),
                    ],
                  ),
                  Text("Row Widget")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 250, height: 250, color: Colors.pinkAccent),
                  Container(width: 150, height: 150, color: Colors.cyanAccent),
                  Container(width: 50, height: 50, color: Colors.limeAccent),
                  Text("Stack Widget")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 0,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.tealAccent,
                          )),
                      Expanded(
                          flex: 3,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.lightGreenAccent,
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.amberAccent,
                          )),
                    ],
                  ),
                  Text("Expanded widget")
                ],
              ),
            ),
          ),
          ListViewBuilderWidget(),
          GridViewWidget()
        ],
      ),
    );
  }
}

// Widget ListView builder
class ListViewBuilderWidget extends StatelessWidget {
  const ListViewBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6'
    ];
    final List<Color> _colors = [
      Colors.amberAccent,
      Colors.blueAccent,
      Colors.blueGrey,
      Colors.cyanAccent,
      Colors.deepOrangeAccent,
      Colors.deepPurpleAccent
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("ListView.builder()"),
          ListView.builder(
            shrinkWrap: true, // digunakan untuk mencegah conflict ListView
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                width: 500,
                height: 100,
                color: _colors[index],
                child: Text(_items[index]),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> _colors = [
      Colors.amberAccent,
      Colors.blueAccent,
      Colors.blueGrey,
      Colors.cyanAccent,
      Colors.deepOrangeAccent,
      Colors.deepPurpleAccent
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("GridView.count()"),
          GridView.count(
            shrinkWrap:
                true, // opsi ini untuk mencegah conflict dengan parent (ListView)
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              Container(color: Colors.red),
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.yellow),
            ],
          ),
          Text("GridView.builder()"),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemCount: _colors.length,
            itemBuilder: (context, index) {
              return Container(
                color: _colors[index],
              );
            },
          ),
          Text("GridView.extent()"),
          GridView.extent(
              shrinkWrap: true,
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: _colors.map(
                (e) {
                  var random = Random();
                  int rand_num = random.nextInt(900) + 150;
                  int rand_num_2 = random.nextInt(900) + 45;
                  return Image.network(
                      'https://picsum.photos/id/$rand_num/$rand_num_2/300');
                },
              ).toList())
        ],
      ),
    );
  }
}
