import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Taskformdialogupdate extends StatefulWidget {
  final updatedData;
  const Taskformdialogupdate({super.key, required this.updatedData});

  @override
  State<Taskformdialogupdate> createState() => _TaskformdialogupdateState();
}

class _TaskformdialogupdateState extends State<Taskformdialogupdate> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late bool _isCompleted;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.updatedData['title'];
    _descriptionController.text = widget.updatedData['description'];
    _isCompleted = widget.updatedData['isCompleted'];
  }

  Future<void> updateTask(
      String title, String description, bool completed, String taskId) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').doc(taskId).update({
        'title': title,
        'description': description,
        'isCompleted': completed
      });
      print("Task berhasil diperbarui");
    } catch (e) {
      print("Gagal: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Update task"),
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
              SizedBox(height: 5),
              Checkbox(
                value: _isCompleted,
                onChanged: (value) {
                  setState(() {
                    _isCompleted = !_isCompleted;
                  });
                },
              )
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
              updateTask(_titleController.text, _descriptionController.text,
                  _isCompleted, widget.updatedData['id']);
              Navigator.pop(context); // Tutup modal setelah menyimpan
            }
          },
          child: Text("Simpan"),
        ),
      ],
    );
  }
}
