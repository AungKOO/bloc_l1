import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_bloc/bloc/greeting_bloc.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<GreetingBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Pattern"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DisplayText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                  color: Colors.blueAccent,
                  child: Text(
                    "Howdy",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    bloc..add(HowdyEvent());
                  }),
              FlatButton(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                  color: Colors.green,
                  child: Text(
                    "What's up!",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    bloc.add(WhatUpEvent());
                  }),
              FlatButton(
                  padding: EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 20.0, bottom: 20.0),
                  color: Colors.red,
                  child: Text(
                    "You're Rock!",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    bloc.add(YouAreRockEvent());
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class DisplayText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GreetingBloc, GreetingState>(
      builder: (context, state) {
        String _greet;

        if (state is GreetingInitial) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          );
        } else if (state is HowdyState) {
          _greet = state.greeting;
        } else if (state is WhatUpState) {
          _greet = state.greeting;
        } else if (state is YouAreRockState) {
          _greet = state.youAreRockGreet;
        } else if (state is ErrorState) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Error occurs!",
              style: GoogleFonts.pacifico(
                fontSize: 40.0,
                color: Colors.red,
              ),
            ),
          );
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Text(
            "$_greet",
            style: TextStyle(
                fontSize: 40.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
