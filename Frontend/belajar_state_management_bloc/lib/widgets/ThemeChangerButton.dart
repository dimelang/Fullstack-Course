import 'package:belajar_state_management_bloc/bloc/ThemeChangerCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Themechangerbutton extends StatelessWidget {
  const Themechangerbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(child: BlocBuilder<Themechangercubit, bool>(
      builder: (context, state) {
        return Icon(state ? Icons.nightlight : Icons.sunny);
      },
    ), onPressed: () {
      context.read<Themechangercubit>().changeTheme();
    });
  }
}
