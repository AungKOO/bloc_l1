import 'dart:async';

import 'package:bloc/bloc.dart';

part 'greeting_event.dart';
part 'greeting_state.dart';

class GreetingBloc extends Bloc<GreetingEvent, GreetingState> {
  static const List<String> greetList = [
    "Howdy",
    "What's Up!",
    "You are Rock!"
  ];
  GreetingBloc() : super(GreetingInitial());

  @override
  Stream<GreetingState> mapEventToState(
    GreetingEvent event,
  ) async* {
    if (event is HowdyEvent) {
      yield GreetingInitial();
      final message = await getData(0);
      print(message);
      yield HowdyState(message);
    } else if (event is WhatUpEvent) {
      yield GreetingInitial();
      final message = await getData(1);
      yield WhatUpState(message);
    } else if (event is YouAreRockEvent) {
      try {
        final String greet = await getError(2);
        yield YouAreRockState(greet);
      } on Exception {
        yield ErrorState();
      }
    }
  }

  Future<String> getData(int index) async {
    await Future.delayed(Duration(seconds: 1));
    return greetList[index];
  }

  Future<String> getError(int index) async {
    throw Exception("Error");
  }
}
