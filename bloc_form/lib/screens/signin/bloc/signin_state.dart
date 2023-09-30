part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitial extends SigninState {}

class SigninValidState extends SigninState{}


class SigninErrorState extends SigninState{
  final String errorMsg;
  SigninErrorState(this.errorMsg);
}

class SigninLoadingState extends  SigninState{}


class SigninButtonPressedState extends  SigninState{}