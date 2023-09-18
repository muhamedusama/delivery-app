import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/models/Ordersmodel.dart';
import 'package:delivery/screens/supervisor/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SupervisorCubit extends Cubit<OrdersState> {
  SupervisorCubit() : super(OrdersLoading());

  static SupervisorCubit get(context) => BlocProvider.of(context);

  late int lengthoforders = 0;

  // getorders() async {
  //   List<Map<String, dynamic>> allorders = [];
  //   late Map<String, dynamic> order;
  //   print("get user name function is working?");
  //   await FirebaseFirestore.instance.collection("Orders").where(
  //       "taken", isEqualTo: "false").get().then((value) =>
  //   {
  //     value.docs.forEach((element) {
  //       //print((element.data()));
  //       order = element.data();
  //       allorders.add(order);
  //     }),
  //
  //   });
  //
  //   print(allorders.length);
  //   lengthoforders = allorders.length;
  // }

  void listenForOrders() {
    emit(OrdersLoading());
    print('Listening for orders...');
    final ordersCollection = FirebaseFirestore.instance.collection('Orders');

    ordersCollection
        .where('taken', isEqualTo: false)
        .snapshots()
        .listen((querySnapshot) {
      final orders = querySnapshot.docs.map((document) {
        final data = document.data();
        return Ordersmodel(
          Supervisor_name: data['Supervisor_name'],
          address: data['address'],
          driver_name: data['driver name'],
          drivers: data['drivers'],
          rest_name: data['rest_name'],
          taken_or_not: data['taken'],
        );
      }).toList();

      emit(OrdersLoaded(orders));
    }, onError: (error) {
      emit(OrdersError("Failed to listen for orders: $error"));
    });
  }


}