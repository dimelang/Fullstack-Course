import 'package:belajar_integrasi_firebase/widgets/ConfirmDialog.dart';
import 'package:belajar_integrasi_firebase/widgets/TaskFormDialogInsert.dart';
import 'package:belajar_integrasi_firebase/widgets/TaskFormDialogUpdate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  const Taskpage({super.key});

  @override
  State<Taskpage> createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  Stream<QuerySnapshot> getTask() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    return FirebaseFirestore.instance
        .collection('tasks')
        .where('userId', isEqualTo: userId)
        .snapshots();
  }

  Future<void> updateStatusTask(bool value, String taskId) async {
    await FirebaseFirestore.instance
        .collection('tasks')
        .doc(taskId)
        .update({'isCompleted': value});
  }

  Future<void> deleteTask(String idDoc) async {
    try {
      await FirebaseFirestore.instance.collection('tasks').doc(idDoc).delete();
      print("Berhasil menghapus task");
    } catch (e) {
      print("Gagal menghapus task: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Task Management Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Taskformdialoginsert();
                },
              );
            },
            icon: Icon(Icons.add)),
      ),
      body: Padding(padding: EdgeInsets.all(15), child: listTask()),
    );
  }

  Widget listTask() {
    return StreamBuilder(
      stream: getTask(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text("Data belum tersedia"),
          );
        }
        final tasks = snapshot.data!.docs;
        return Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              var task = tasks[index].data() as Map<String, dynamic>;
              String taskId = tasks[index].id;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  titleTextStyle: TextStyle(fontWeight: FontWeight.w600),
                  subtitleTextStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12,
                      letterSpacing: 1),
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.blueAccent)),
                  title: Text(task['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(task['description']),
                      Checkbox(
                        value: task['isCompleted'],
                        onChanged: (value) {
                          updateStatusTask(value!, taskId);
                        },
                      )
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Taskformdialogupdate(
                                      updatedData: task);
                                });
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Confirmdialog(
                                    title: "Delete task",
                                    msg: "Anda yakin ingin menghapus data ini?",
                                    callBack: () {
                                      deleteTask(task['id']);
                                    });
                              },
                            );
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
