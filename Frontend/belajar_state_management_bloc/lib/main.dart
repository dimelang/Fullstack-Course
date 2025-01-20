import 'package:belajar_state_management_bloc/bloc/CounterCubit.dart';
import 'package:belajar_state_management_bloc/bloc/ThemeChangerCubit.dart';
import 'package:belajar_state_management_bloc/pages/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) {
        return Countercubit();
      },
    ),
    BlocProvider(
      create: (context) {
        return Themechangercubit();
      },
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Themechangercubit, bool>(
      builder: (context, state) {
        return MaterialApp(
          theme: state ? ThemeData.light() : ThemeData.dark(),
          home: Homepage(),
        );
      },
    );
  }
}
