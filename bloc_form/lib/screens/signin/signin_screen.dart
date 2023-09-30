import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/signin_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController emailValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In with Email'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is SigninErrorState) {
                  return Text(
                    state.errorMsg,
                    style: const TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
            TextField(
              controller: emailValue,
              onChanged: (val) {
                BlocProvider.of<SigninBloc>(context).add(SigninTextChangedEvent(
                    emailValue.text, passwordValue.text));
              },
              decoration: const InputDecoration(
                hintText: "Email Address",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordValue,
              onChanged: (val) {
                BlocProvider.of<SigninBloc>(context).add(SigninTextChangedEvent(
                    emailValue.text, passwordValue.text));
              },
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<SigninBloc, SigninState>(
              listener: (context, state) {
                if(state is SigninButtonPressedState){
                  if(state is SigninButtonPressedState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Valid he bro")));
                  }
                }
              },
              builder: (context, state) {
                return GestureDetector(
                  onTap: () {
                    if (state is SigninValidState) {
                      BlocProvider.of<SigninBloc>(context).add(
                          SigninButtonPressedEvent(
                              emailValue.text, passwordValue.text));
                    }

                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: (state is SigninValidState)
                          ? Colors.teal
                          : Colors.grey,
                    ),
                    child: const Text("Sign in"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
