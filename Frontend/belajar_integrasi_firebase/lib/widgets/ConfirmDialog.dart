import 'package:flutter/material.dart';

class Confirmdialog extends StatelessWidget {
  final title;
  final msg;
  final Function() callBack;
  const Confirmdialog(
      {super.key,
      required this.title,
      required this.msg,
      required this.callBack});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Tutup modal
          },
          child: Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            callBack();
            Navigator.pop(context); // Tutup modal setelah menyimpan
          },
          child: Text("Proses"),
        ),
      ],
    );
  }
}
