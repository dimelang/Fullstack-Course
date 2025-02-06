import 'package:belajar_integrasi_firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Modalupdatefriend extends StatefulWidget {
  final currentId;
  final currentName;
  final currentAddress;
  const Modalupdatefriend(
      {super.key,
      required this.currentId,
      required this.currentName,
      required this.currentAddress});

  @override
  State<Modalupdatefriend> createState() => _ModalupdatefriendState();
}

class _ModalupdatefriendState extends State<Modalupdatefriend> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  void updateFriend() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    DatabaseReference dbRef = FirebaseDatabase.instance
        .ref("users/$userId/friends/${widget.currentId}");
    await dbRef.update(
        {"name": _nameController.text, "address": _addressController.text});
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.currentName;
    _addressController.text = widget.currentAddress;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Edit Friend"),
      content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Nama wajib diisi";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: _addressController,
                  validator: (value) {
                    if (value == '' || value!.isEmpty) {
                      return "Nama wajib diisi";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Nama',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ],
          )),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Tutup modal
          },
          child: Text("Batal"),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              updateFriend();
              Navigator.pop(context); // Tutup modal setelah menyimpan
            }
          },
          child: Text("Update"),
        ),
      ],
    );
  }
}
