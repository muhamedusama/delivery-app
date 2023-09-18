import 'package:cloud_firestore/cloud_firestore.dart';
class Ordersmodel
{

  String? Supervisor_name;
  String? address;
  String? driver_name;
  int drivers;
  String? rest_name;
  bool? taken_or_not;


  Ordersmodel({
    required this.Supervisor_name,
    required this.address,
    required this.driver_name,
    required this.drivers,
    required this.rest_name,
    required this.taken_or_not,
  });
  // Ordersmodel.fromJson(Map<String,dynamic> json)
  // {
  //   Supervisor_name = json['Supervisor name'];
  //   address = json['address'];
  //   driver_name = json['driver name'];
  //   drivers = json[drivers];
  //   rest_name = json['rest_name'];
  //   taken_or_not = json['taken'];
  // }
  // Map<String,dynamic> toMap()
  //
  // {
  //   return{
  //     // 'Details' :Details,
  //     'Supervisor name':Supervisor_name,
  //     'address':address,
  //     'driver name':driver_name,
  //     'drivers':drivers,
  //     'rest_name':rest_name,
  //     'taken_or_not':taken_or_not,
  //
  //   };
  // }

}
