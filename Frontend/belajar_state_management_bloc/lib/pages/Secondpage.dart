import 'package:belajar_state_management_bloc/bloc/CounterCubit.dart';
import 'package:belajar_state_management_bloc/widgets/ThemeChangerButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Secondpage extends StatelessWidget {
  const Secondpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Themechangerbutton(),
      body: Center(
        child: BlocBuilder<Countercubit, int>(
          bloc: context.read<Countercubit>(),
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 24),
            );
          },
        ),
      ),
    );
  }
}
