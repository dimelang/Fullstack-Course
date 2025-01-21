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

  void getTasks(String url, String paramKey, String paramVal) async {
    setState(() {
      taskFuture =
          taskservice.getTask(url, paramKey: paramKey, paramVal: paramVal);
    });
  }

  void toggleStatus(int index, bool newValue, List<dynamic> task) {
    setState(() {
      task[index]['status'] = newValue;
    });
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

    getTasks("http://localhost:8080/api/tasks/user", 'id', user.id.toString());

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
                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      print(task);
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
                                    toggleStatus(index, value, tasks);
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                    child: Text("Data tidak tersedia!"),
                  );
                }
              },
            )));
  }
}
