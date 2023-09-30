part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}


class SigninTextChangedEvent extends SigninEvent{
  final String emailValue;
  final String passwordValue;
  SigninTextChangedEvent(this.emailValue,this.passwordValue);
}



class SigninButtonPressedEvent extends SigninEvent{
  final String email;
  final String password;
  SigninButtonPressedEvent(this.email,this.password);
}