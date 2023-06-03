import 'package:flutter/material.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import '../Model/User.dart';

class UserProvider extends ChangeNotifier {
  Future<bool> RegisterUser(
    String name,
    String last_name,
    String gender,
    String image,
    String tel,
    String password,
    String birth_day,
    String add_village,
    String add_city,
    String add_province,
    String add_detail,
    String email,
    String web,
    String job,
    String job_type,
    String user_type,
  ) async {
    FormData DataRegister = FormData.fromMap({
      'name': name,
      'last_name': last_name,
      'gender': gender,
      'tel': tel,
      'password': password,
      'birth_day': birth_day,
      'add_village': add_village,
      'add_city': add_city,
      'add_province': add_province,
      'add_detail': add_detail,
      'email': email,
      'web': web,
      'job': job,
      'job_type': job_type,
      'user_type': user_type,
    });

    return true;
  }
}
