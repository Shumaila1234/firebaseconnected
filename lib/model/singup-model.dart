import 'package:flutter/material.dart';

class SignupModel{
  late String name;
  late String password;
  late String confirmPassword;

  SignupModel(this.name,this.password,this.confirmPassword);

  SignupModel.fromJson(Map<dynamic, dynamic> json, Map map)
    : name = json['name'] as String,
      password= json['password'] as String,
      confirmPassword=json['confrimpassword'] as String;

Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'name': name,
      'password': password,
      'confirmpassword':confirmPassword
    };
}