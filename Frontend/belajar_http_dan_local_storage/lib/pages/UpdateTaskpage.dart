import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskGetRequest.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskPutRequest.dart';
import 'package:belajar_http_dan_local_storage/service/TaskService.dart';
import 'package:flutter/material.dart';

class Updatetaskpage extends StatefulWidget {
  final Taskgetrequest taskgetrequest;
  const Updatetaskpage({super.key, required this.taskgetrequest});

  @override
  State<Updatetaskpage> createState() => _UpdatetaskpageState();
}

class _UpdatetaskpageState extends State<Updatetaskpage> {
  final Taskservice taskservice = Taskservice();
  final Helper helper = Helper();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> priorities = ["LOW", "MEDIUM", "HIGH"];
  String? _selected_item;

  @override
  void initState() {
    _titleController.text = widget.taskgetrequest.title;
    _descriptionController.text = widget.taskgetrequest.description;
    _selected_item = widget.taskgetrequest.priority;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(helper.colorFromHex('#2E5077')),
        automaticallyImplyLeading: false,
        title: const Text(
          "Update Tugas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  spacing: 15,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        labelStyle: TextStyle(
                            fontSize: 13, color: Colors.grey.shade600),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(helper.colorFromHex('#4DA1A9')),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8)),
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Title wajib diisi";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        controller: _descriptionController,
                        minLines: 3,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelStyle: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(helper.colorFromHex('#4DA1A9')),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Description',
                        )),
                    DropdownButtonFormField(
                      hint: Text("Pilih prioritas tugas"),
                      value: _selected_item,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          labelStyle: TextStyle(
                              fontSize: 13, color: Colors.grey.shade600),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(8)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(helper.colorFromHex('#4DA1A9')),
                                  width: 1.5),
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Priority'),
                      items: priorities.map(
                        (e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selected_item = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return "Priority wajib diisi";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              )),
          Padding(
            padding: EdgeInsets.all(25),
            child: SizedBox(
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Color(helper.colorFromHex('#79D7BE')),
                child: InkWell(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      Taskputrequest task = Taskputrequest(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          priority: _selected_item!,
                          status: widget.taskgetrequest.status);
                      bool response = await taskservice.updateTask(
                          "http://localhost:8080/api/tasks",
                          widget.taskgetrequest.id,
                          task);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(response
                              ? "Berhasil mengubah task"
                              : "gagal mengubah task"),
                          backgroundColor: response
                              ? Color(Helper().colorFromHex("#16C47F"))
                              : Color(Helper().colorFromHex("#F93827"))));
                      if (response) {
                        Future.delayed(Duration(seconds: 1)).then(
                          (value) {
                            Navigator.pop(context, response);
                          },
                        );
                      }
                    }
                  },
                  child: Center(
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(helper.colorFromHex('#F6F4F0'))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
