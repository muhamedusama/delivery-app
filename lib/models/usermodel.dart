import 'package:cloud_firestore/cloud_firestore.dart';
class userModel
{
  String? name;
  String? email;
  String? role;
  String? uId;

  userModel({
    required this.name,
    required this.email,
    required this.role,
    required this.uId,
  });
  userModel.fromJson(Map<String,dynamic> json)
  {
    name = json['name'];
    email = json['email'];
    role = json['role'];
    uId = json['uId'];
  }
  Map<String,dynamic> toMap()
  {
    return{
      'name':name,
      'email':email,
      'role':role,
      'uId':uId,
    };
  }

}
