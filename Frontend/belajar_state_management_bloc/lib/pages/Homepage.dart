import 'package:belajar_state_management_bloc/bloc/CounterCubit.dart';
import 'package:belajar_state_management_bloc/pages/Secondpage.dart';
import 'package:belajar_state_management_bloc/widgets/ThemeChangerButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocConsumer<Countercubit, int>(
              builder: (context, state) {
                return Text(
                  state.toString(),
                  style: TextStyle(color: Colors.blue, fontSize: 24),
                );
              },
              buildWhen: (previous, current) {
                if (current % 2 == 0) {
                  return true;
                }
                return false;
              },
              listener: (context, state) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Counter mencapai kelipatan 10")));
              },
              listenWhen: (previous, current) {
                if (current % 10 == 0) {
                  return true;
                }
                return false;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<Countercubit>().decrement();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: Colors.pinkAccent,
                    )),
                IconButton(
                    onPressed: () {
                      context.read<Countercubit>().increment();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.greenAccent,
                    )),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Secondpage();
                  },
                ));
              },
              label: Text("Submit"),
              icon: Icon(Icons.save),
            )
          ],
        ),
      ),
    );
  }
}
