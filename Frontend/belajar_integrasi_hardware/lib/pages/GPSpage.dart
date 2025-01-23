import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Gpspage extends StatefulWidget {
  const Gpspage({super.key});

  @override
  State<Gpspage> createState() => _GpspageState();
}

class _GpspageState extends State<Gpspage> {
  bool _isGranted = false;
  String _currentLocation = "Lokasi belum tersedia";

  Future<void> _checkAndRequestPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      print(status);
      _isGranted = true;
    }
  }

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _currentLocation = "Layanan lokasi tidak aktif";
      });
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _currentLocation = "Izin lokasi ditolak";
        });
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _currentLocation =
            "Izin lokasi ditolak permanen. Aktifkan di pengaturan";
      });
      return;
    }

    final Position _position;
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentLocation =
          "Lokas saat ini, latitude: ${_position.latitude}, longitude: ${_position.longitude}";
    });
  }

  @override
  void initState() {
    super.initState();
    _checkAndRequestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Camera page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_currentLocation),
            ElevatedButton(onPressed: _getLocation, child: Text("Get Location"))
          ],
        ),
      ),
    );
  }
}
