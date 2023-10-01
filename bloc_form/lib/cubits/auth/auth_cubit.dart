import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitial()){
    User? currentUser = _auth.currentUser;
    if(currentUser!=null){
      emit(AuthLoggedInState(currentUser));
    }else{
      emit(AuthLoggedOutState());
    }
  }

  String? _verificationId;


  void sendOTP(String phone) async {
    emit(AuthLoadingState());
    await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (phoneAuthCredentials) {
          signinWithPhone(phoneAuthCredentials);
        },
        verificationFailed: (error) {
          emit(AuthErrorState(error.message.toString()));
        },
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(AuthCodeSentState());
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        });
  }

  void otpVerify(String otp) async {
    emit(AuthLoadingState());
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    print(otp);
    signinWithPhone(credential);
  }

  void signinWithPhone(PhoneAuthCredential credential) async {
    try{
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      if(userCredential!= null){
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch(e){
      emit(AuthErrorState(e.message.toString()));
    }
  }

  void logout() async {
    await _auth.signOut() ;
    emit(AuthLoggedOutState()) ;
  }
}
