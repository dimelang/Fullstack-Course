import 'package:belajar_integrasi_firebase/helper/Helper.dart';
import 'package:belajar_integrasi_firebase/pages/Friendspage.dart';
import 'package:belajar_integrasi_firebase/pages/Loginpage.dart';
import 'package:belajar_integrasi_firebase/pages/Taskpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final user;
  const Homepage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final helper = Helper();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Homepage"),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil logout'),
                      backgroundColor: Colors.greenAccent,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Gagal logout'),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                }
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Realtime Database Demo"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(helper.colorFromHex("#79D7BE")),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Friendspage();
                          },
                        ));
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Friends Management',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(helper.colorFromHex("#F6F4F0"))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Firestore Demo"),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(helper.colorFromHex("#DE3163")),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Taskpage();
                          },
                        ));
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Task Management',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(helper.colorFromHex("#F6F4F0"))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
