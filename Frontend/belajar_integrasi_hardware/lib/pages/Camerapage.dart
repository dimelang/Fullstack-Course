import 'package:belajar_integrasi_hardware/pages/PreviewCapture.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Camerapage extends StatefulWidget {
  const Camerapage({super.key});

  @override
  State<Camerapage> createState() => _CamerapageState();
}

class _CamerapageState extends State<Camerapage> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isInitialized = false;

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.high,
        enableAudio: false);
    await _controller.initialize();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _toggleFlash() async {
    final currentFlashMode = _controller.value.flashMode;
    await _controller.setFlashMode(
        currentFlashMode == FlashMode.off ? FlashMode.torch : FlashMode.off);
  }

  Future<void> _switchCamera() async {
    final currentIndex = _cameras.indexOf(_controller.description);
    final nextIndex = (currentIndex + 1) % _cameras.length;
    _controller = CameraController(_cameras[nextIndex], ResolutionPreset.high);
    await _controller.initialize();
    setState(() {});
  }

  Future<void> _captureAndSaveImage(BuildContext context) async {
    try {
      final XFile file = await _controller.takePicture();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Previewcapture(image_path: file.path),
          );
        },
      ));
    } catch (e) {
      print('Gagal mengambil gambar: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      body: _isInitialized
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                Expanded(
                  child: Transform.scale(
                    scale: 2 / _controller.value.aspectRatio,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: CameraPreview(_controller),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: _toggleFlash, icon: Icon(Icons.flash_on)),
                      IconButton(
                          onPressed: _switchCamera,
                          icon: Icon(Icons.cameraswitch)),
                      IconButton(
                          onPressed: () => _captureAndSaveImage(context),
                          icon: Icon(Icons.camera_alt))
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
