import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Taskformdialoginsert extends StatefulWidget {
  const Taskformdialoginsert({super.key});

  @override
  State<Taskformdialoginsert> createState() => _TaskformdialoginsertState();
}

class _TaskformdialoginsertState extends State<Taskformdialoginsert> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _userId = FirebaseAuth.instance.currentUser!.uid;

  Future<void> addTask() async {
    CollectionReference colRef = FirebaseFirestore.instance.collection('tasks');
    try {
      await colRef.add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'isCompleted': false,
        'userId': _userId
      });
      print("sukses");
    } catch (e) {
      print("gagal: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Insert task"),
      content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _titleController,
                validator: (value) {
                  if (value == '' || value!.isEmpty) {
                    return "Title wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                minLines: 3,
                maxLines: 5,
                controller: _descriptionController,
                validator: (value) {
                  if (value == '' || value!.isEmpty) {
                    return "Description wajib diisi";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
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
              addTask();
              Navigator.pop(context); // Tutup modal setelah menyimpan
            }
          },
          child: Text("Simpan"),
        ),
      ],
    );
  }
}
