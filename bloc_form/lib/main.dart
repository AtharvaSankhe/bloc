import 'package:bloc_form/cubits/auth/auth_cubit.dart';
import 'package:bloc_form/routes.dart';
import 'package:bloc_form/screens/signin.dart';
import 'package:bloc_form/screens/signin/signin_screen.dart';
import 'package:bloc_form/screens/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.onGenerateRoute,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState,newState){
            return oldState is AuthInitial ;
          },
          builder: (context, state) {
            if (state is AuthLoggedInState) {
              return Scaffold(body: Container(color: Colors.red,),);
            }
            else
            {
              return SiginScreen();
            }
          },
        ),
      ),
    );
  }
}
