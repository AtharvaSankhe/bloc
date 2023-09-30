import 'package:bloc_internet/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: BlocConsumer<InternetCubit, InternetState>(
            // child: BlocConsumer<InternetBloc, InternetState>(
              listener: (context, state) {
                if(state is InternetGainedState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Connected he bro"),backgroundColor: Colors.green,)
                  );
                }else if(state is InternetLostState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Connected nhi he  bro"),backgroundColor: Colors.red,)
                  );
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("What up"),backgroundColor: Colors.blue,)
                  );
                }
              },
              builder: (context, state) {
                if(state is InternetGainedState){
                  return Text('Connected');
                }else if(state is InternetLostState){
                  return Text("Disconnected");
                }else{
                  return Text("Loading");
                }
              },
            ),
            // child: BlocBuilder<InternetBloc, InternetState>(
            //   //BlocBuilder => Used to show things on UI ************************************************
            //   //BlocListener => Used to do things on background like running a function *****************
            //   //BlocConsumer => It is a mixture of both *************************************************
            //   builder: (context, state) {
            //     if(state is InternetGainedState){
            //       return Text('Connected');
            //     }else if(state is InternetLostState){
            //       return Text("Disconnected");
            //     }else{
            //       return Text("Loading");
            //     }
            //   },
            // ),
          ),
        ),
      ),
    );
  }
}
