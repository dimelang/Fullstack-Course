import 'package:belajar_http_dan_local_storage/helper/Helper.dart';
import 'package:belajar_http_dan_local_storage/model/Task/TaskGetRequest.dart';
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

  // Fungsi untuk memuat tugas dari API
  void fetchTasks() {
    final userProvider = Provider.of<Userprovider>(context, listen: false);
    final user = userProvider.getUser();

    if (user != null) {
      taskFuture = taskservice.getTask(
        "http://localhost:8080/api/tasks/user",
        paramKey: 'id',
        paramVal: user.id.toString(),
      );
    }
  }

  Future<void> toggleStatus(
      int idTask, bool newValue, List<Taskgetrequest> tasks, int index) async {
    var url = "http://localhost:8080/api/tasks";
    bool response = await taskservice.updateStatus(url, idTask, newValue);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
            Text(response ? "Update status berhasil" : "Update status gagal"),
        backgroundColor: response ? Colors.green : Colors.red));
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

    final user = userProvider.getUser();
    if (user == null) {
      return Scaffold(
        body: Center(
          child: Text("User not loged"),
        ),
      );
    }

    return Scaffold(
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
                icon: Icon(Icons.logout)),
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
                                        onPressed: () {},
                                        icon: Icon(Icons.edit),
                                        color: Colors.orange,
                                      ),
                                      IconButton(
                                        tooltip: "Hapus",
                                        onPressed: () {},
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
