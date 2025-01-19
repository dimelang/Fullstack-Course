import 'package:flutter/material.dart';

class Imagewidget extends StatelessWidget {
  const Imagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sample-image.jpg',
                width: 240,
                height: 240,
                fit: BoxFit.cover,
                color: Colors.red,
                colorBlendMode: BlendMode.multiply,
              ),
              Text("Image.asset()")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://picsum.photos/seed/picsum/200/300',
                fit: BoxFit.cover,
              ),
              Text("Images.network()")
            ],
          )
        ],
      ),
    );
  }
}
