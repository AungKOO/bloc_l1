part of 'greeting_bloc.dart';

abstract class GreetingState {}

class GreetingInitial extends GreetingState {}

class HowdyState extends GreetingState {
  final String greeting;
  HowdyState(this.greeting);
}

class WhatUpState extends GreetingState {
  final String greeting;
  WhatUpState(this.greeting);
}

class YouAreRockState extends GreetingState {
  final String youAreRockGreet;
  YouAreRockState(this.youAreRockGreet);
}

class ErrorState extends GreetingState {}
