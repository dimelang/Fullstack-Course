import 'package:belajar_integrasi_hardware/pages/Camerapage.dart';
import 'package:belajar_integrasi_hardware/pages/GPSpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hardware Integrated Demo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Camerapage();
                    },
                  ));
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Camera",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              color: Colors.blue,
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Gpspage();
                    },
                  ));
                },
                child: Container(
                  width: 100,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Location",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
