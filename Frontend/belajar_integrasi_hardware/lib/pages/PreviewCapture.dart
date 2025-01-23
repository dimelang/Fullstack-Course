import 'dart:io';

import 'package:flutter/material.dart';

class Previewcapture extends StatefulWidget {
  final String image_path;
  const Previewcapture({super.key, required this.image_path});

  @override
  State<Previewcapture> createState() => _PreviewcaptureState();
}

class _PreviewcaptureState extends State<Previewcapture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.image_path)),
    );
  }
}
