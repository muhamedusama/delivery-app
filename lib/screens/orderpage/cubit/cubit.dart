
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/usermodel.dart';
import 'package:delivery/screens/login/cubit/states.dart';
import 'package:delivery/screens/orderpage/cubit/states.dart';
import 'package:delivery/screens/orderpage/orderpage.dart';
import 'package:delivery/shared/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

import '../../../models/Ordersmodel.dart';



class orderpageCubit extends Cubit<orderingStates> {

  orderpageCubit(): super(orderinitialStates());
 var number = 1 ;
  static orderpageCubit get(context)=>BlocProvider.of(context);
  // static UserRepository get instance => Get.find();
  // final _db = FirebaseFirestore.instance;
  TextEditingController sampledata2 = new TextEditingController();
  // Map <String, dynamic> data= {"Details":sampledata1.text,"address":sampledata2.text};
var nulls ="";
var restaurant_name ;
  increasedrivers (){
    number++;
    emit(change_driverno_states());

  }
  decreasedrivers (){
    number= number-1;
    emit(change_driverno_states());
  }
  void createorder (var address ) async {
     await // Map <String, dynamic> data= {"drivers":number,"address":address};
     FirebaseFirestore.instance.collection("Orders").
     doc(
       restaurant_name =  FirebaseAuth.instance.currentUser!.email
     ).set(
       {
         "rest_name":restaurant_name,
         "address": address ,
         "Supervisor name":nulls,
         "driver name":nulls,
         "drivers":number,
         "taken":nulls,
       }
     );


  print("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF");
print(restaurant_name);
  }



}