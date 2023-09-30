import 'package:bloc_internet/blocs/internet/internet_bloc.dart';
import 'package:bloc_internet/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      // create: (context) => InternetBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

