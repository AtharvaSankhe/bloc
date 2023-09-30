import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {

  Connectivity _connectivity = Connectivity() ;
  StreamSubscription? connectivitySubscription ;

  InternetCubit() : super(InternetInitial()){
    connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result== ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        emit(InternetGainedState()) ;
      }
      else{
        emit(InternetLostState()) ;
      }

    });
  }
  @override
  Future<void> close() {
    connectivitySubscription?.cancel() ;
    return super.close();
  }

}
