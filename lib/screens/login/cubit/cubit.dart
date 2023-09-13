


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/usermodel.dart';
import 'package:delivery/screens/login/cubit/states.dart';
import 'package:delivery/shared/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";


class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(LoginInitialStates());
  static LoginCubit get(context)=>BlocProvider.of(context);

  getUserName() async {
    //print(FirebaseAuth.instance.currentUser!.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(value.data());
      role=value.data()?['role'];
      print(role);
    });
  }
  // userModel model = userModel(name: '', email: '', uId: '', role: '');
  //
  // void getUserData()
  // {
  //   emit(GetUserLoadingState());
  //   FirebaseFirestore.instance.collection('users').doc(token).get().then((value){
  //     model = userModel.fromJson(value.data()!);
  //     print("#################"+ model.name!);
  //
  //     emit(GetUserSuccessState());
  //
  //   }).catchError((error){
  //     emit(GetUserErrorState(error.toString()));
  //   });
  // }

  void userLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingStates());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email
        , password: password).then((value) {
      emit(LoginSuccessStates(value.user!.uid));
    }).catchError((error){
      emit(LoginErrorStates(error.toString()));
    });
  }
  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVisibility (){
    isPassword=!isPassword ;
    suffix=isPassword?Icons.visibility_outlined: Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityStates());
  }

}
