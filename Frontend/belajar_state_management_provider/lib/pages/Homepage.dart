import 'package:belajar_state_management_provider/pages/Secondpage.dart';
import 'package:belajar_state_management_provider/providers/Counter.dart';
import 'package:belajar_state_management_provider/widgets/ThemeChangerButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Themechangerbutton(),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Counter>(
              builder: (context, value, child) {
                return Text(
                  value.getCounterValue().toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15,
              children: [
                IconButton(
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).increment();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.greenAccent,
                    )),
                IconButton(
                    onPressed: () {
                      Provider.of<Counter>(context, listen: false).decrement();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.pinkAccent,
                    )),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Secondpage();
                    },
                  ));
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
