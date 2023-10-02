import 'package:bloc_form/screens/phoneverify.dart';
import 'package:bloc_form/screens/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/auth/auth_cubit.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: SiginScreen(),
                ));
        case "/second":
        return MaterialPageRoute(
            builder: (context) => Verify());
    }
  }
}
