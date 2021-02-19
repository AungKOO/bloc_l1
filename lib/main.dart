import 'package:flutter/material.dart';
import 'package:my_bloc/bloc/greeting_bloc.dart';
import 'package:my_bloc/ui/bloc_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = "My BLoC";
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GreetingBloc>(
      create: (context) => GreetingBloc(),
      child: MaterialApp(
        title: _title,
        home: BlocHome(),
      ),
    );
  }
}
