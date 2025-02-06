import 'package:belajar_integrasi_firebase/widgets/ConfirmDialog.dart';
import 'package:belajar_integrasi_firebase/widgets/ModalUpdateFriend.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class Friendspage extends StatefulWidget {
  const Friendspage({super.key});

  @override
  State<Friendspage> createState() => _FriendspageState();
}

class _FriendspageState extends State<Friendspage> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _userId = FirebaseAuth.instance.currentUser!.uid;
  List<Map<String, dynamic>> friends = [];

  void fetchData() {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref("users/$_userId/friends");
    dbRef.onValue.listen(
      (event) {
        if (event.snapshot.value != null) {
          final rawData =
              Map<String, dynamic>.from(event.snapshot.value as Map);
          final List<Map<String, dynamic>> loadedFriends = [];
          rawData.forEach(
            (key, value) {
              loadedFriends.add({
                "id": key,
                "name": value['name'],
                "address": value['address']
              });
            },
          );
          setState(() {
            friends = loadedFriends;
          });
        }
      },
    );
  }

  void addFriend() async {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref("users/$_userId/friends");
    await dbRef.push().set(
        {"name": _nameController.text, "address": _addressController.text});
    _nameController.clear();
    _addressController.clear();
  }

  void deleteFriend(String id) async {
    DatabaseReference dbRef =
        FirebaseDatabase.instance.ref("users/$_userId/friends/$id");
    await dbRef.remove();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Friend Management Page"),
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
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
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: _addressController,
                          validator: (value) {
                            if (value == '' || value!.isEmpty) {
                              return "Alamat wajib diisi";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Alamat',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              addFriend();
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.green,
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: friends.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            titleTextStyle:
                                TextStyle(fontWeight: FontWeight.w600),
                            subtitleTextStyle: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 12,
                                letterSpacing: 1),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.blueAccent)),
                            title: Text(friends[index]['name']),
                            subtitle: Text(friends[index]['address']),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      final updatedId = friends[index]['id'];
                                      final _updateName =
                                          friends[index]['name'];
                                      final _updateAddress =
                                          friends[index]['address'];
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Modalupdatefriend(
                                              currentId: updatedId,
                                              currentName: _updateName,
                                              currentAddress: _updateAddress);
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.amber.shade700,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      final deletedId = friends[index]['id'];
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Confirmdialog(
                                              title: "Delete Friend",
                                              msg:
                                                  "Anda yakin ingin menghapus data ini?",
                                              callBack: () {
                                                deleteFriend(deletedId);
                                              });
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red.shade700,
                                    )),
                              ],
                            )),
                      );
                    },
                  ))
                ],
              ))),
    );
  }
}
