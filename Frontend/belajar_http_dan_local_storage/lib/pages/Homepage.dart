import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskGetRequest.dart';
import 'package:belajar_http_dan_local_storage/pages/AddTaskpage.dart';
import 'package:belajar_http_dan_local_storage/pages/UpdateTaskpage.dart';
import 'package:belajar_http_dan_local_storage/provider/LoginStatusProvider.dart';
import 'package:belajar_http_dan_local_storage/provider/UserProvider.dart';
import 'package:belajar_http_dan_local_storage/service/TaskService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Taskgetrequest>> taskFuture;
  final Taskservice taskservice = Taskservice();

  @override
  void initState() {
    super.initState();
    fetchTasks(); // Memuat data awal
  }

  // Fungsi untuk memuat seluruh task
  void fetchTasks() {
    final userProvider = Provider.of<Userprovider>(context, listen: false);
    final user = userProvider.getUser();

    if (user != null) {
      setState(() {
        taskFuture = taskservice.getTask(
          "http://localhost:8080/api/tasks/user",
          paramKey: 'id',
          paramVal: user.id.toString(),
        );
      });
    }
  }

  // fungsi untuk udpate status task (CheckboxWidget)
  Future<void> toggleStatus(
      int idTask, bool newValue, List<Taskgetrequest> tasks, int index) async {
    var url = "http://localhost:8080/api/tasks";
    bool response = await taskservice.updateStatus(url, idTask, newValue);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(response ? "Update status berhasil" : "Update status gagal"),
        backgroundColor: response
            ? Color(Helper().colorFromHex("#16C47F"))
            : Color(Helper().colorFromHex("#F93827"))));
    if (response) {
      setState(() {
        tasks[index].status = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Helper helper = Helper();
    final loginStatusProvider = Provider.of<Loginstatusprovider>(context);
    final userProvider = Provider.of<Userprovider>(context);
    if (!loginStatusProvider.loginStatus()) {
      Future.microtask(() => Navigator.pushReplacementNamed(context, '/login'));
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()), // Loading sementara
      );
    }

    // cek jika data user telah disimpan pada shared preferences sebelumnya
    final user = userProvider.getUser();
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("User not loged"),
        ),
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return CreatTaskPage();
              },
            )).then(
              (value) {
                print(value);
                if (value == true) {
                  fetchTasks();
                }
              },
            );
          },
          shape: CircleBorder(eccentricity: 0.7),
          backgroundColor: Color(helper.colorFromHex('#2E5077')),
          hoverColor: Color(helper.colorFromHex('#436285')),
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(helper.colorFromHex('#2E5077')),
          automaticallyImplyLeading: false,
          title: const Text(
            "Homepage",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  loginStatusProvider.removeLoginStatus();
                  userProvider.removeUser();
                  await Future.delayed(Duration(seconds: 1)).then(
                    (value) {
                      Navigator.pop(context);
                    },
                  );
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: taskFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  final tasks = snapshot.data!;
                  if (tasks.length != 0) {
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey.shade300),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 5,
                                  offset: Offset(0, 3))
                            ],
                          ),
                          child: Row(
                            spacing: 10,
                            children: [
                              Expanded(
                                flex: 0,
                                child: Checkbox(
                                  activeColor: Colors.blue,
                                  value: task.status,
                                  onChanged: (value) {
                                    if (value != null) {
                                      toggleStatus(
                                          task.id, value, tasks, index);
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 5,
                                      children: [
                                        Text(
                                          task.title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          task.priority,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      task.description,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black54),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    spacing: 10,
                                    children: [
                                      IconButton(
                                        tooltip: "Edit",
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                            builder: (context) {
                                              return Updatetaskpage(
                                                  taskgetrequest: task);
                                            },
                                          )).then(
                                            (value) {
                                              if (value) {
                                                fetchTasks();
                                              }
                                            },
                                          );
                                        },
                                        icon: Icon(Icons.edit),
                                        color: Colors.orange,
                                      ),
                                      IconButton(
                                        tooltip: "Hapus",
                                        onPressed: () async {
                                          var url =
                                              "http://localhost/api/tasks";
                                          bool response = await taskservice
                                              .deleteTask(url, task.id);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(response
                                                      ? "Berhasil menghapus task"
                                                      : "Gagal menghapus task"),
                                                  backgroundColor: response
                                                      ? Color(Helper()
                                                          .colorFromHex(
                                                              "#16C47F"))
                                                      : Color(Helper()
                                                          .colorFromHex(
                                                              "#F93827"))));
                                          if (response) {
                                            fetchTasks();
                                          }
                                        },
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                      ),
                                    ],
                                  ))
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text("Data belum tersedia!"),
                    );
                  }
                } else {
                  return Center(
                    child: Text("Data tidak tersedia!"),
                  );
                }
              },
            )));
  }
}
