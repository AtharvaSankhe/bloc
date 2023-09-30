import 'dart:async';
import 'package:email_validator/email_validator.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninTextChangedEvent>((event, emit) {
      if(EmailValidator.validate(event.emailValue)==false ){
        emit(SigninErrorState("Please enter a Valid Email"));
      }
      else if(event.passwordValue.length <= 8){
        emit(SigninErrorState("Please enter a Valid Password"));
      }
      else{
        emit(SigninValidState());
      }


    });

    on<SigninButtonPressedEvent>((event, emit){
      emit(SigninButtonPressedState()) ;
    });
  }
}
