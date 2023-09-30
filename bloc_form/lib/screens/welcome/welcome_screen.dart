import 'package:bloc_form/screens/signin/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../signin/bloc/signin_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                BlocProvider(
                  create: (context) => SigninBloc(),
                  child: SignIn(),
                )));
          },
          child: Container(
            alignment: Alignment.center,
            child: const Text("GO to next page"),
          ),
        ),
      ),
    );
  }
}
