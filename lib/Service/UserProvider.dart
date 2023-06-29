import 'dart:io';

import 'package:flutter/material.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import '../Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  int AdminPage = 0;
  void SetAdminPage(int page) {
    AdminPage = page;
    // print(page);
    notifyListeners();
  }

  // list user
  List<User> ListUser = [];
  List<User> ListUserSearch = [];

  void AddListUser(User _user) {
    ListUser.add(_user);
    notifyListeners();
  }

  void UpdateUser(User _user) {
    ListUser[0] = _user;
    notifyListeners();
  }

  Future<bool> RegisterUser(
    String name,
    String last_name,
    String gender,
    File? image,
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
  ) async {
    if (image != null) {
      String filename = image.path.split('/').last;
      FormData DataRegister = FormData.fromMap({
        'name': name,
        'last_name': last_name,
        'gender': gender,
        'image': await MultipartFile.fromFile(
          image.path,
          filename: filename,
        ),
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
      });
      print(image.path);
      final response = await dio().post('/register',
          data: DataRegister,
          options: Options(headers: {
            "Content-Type": "application/json; charset=utf-8",
          }, validateStatus: ((status) => true)));
      // print('sent data2');
      print(response);

      if (response.statusCode == 200) {
        return true;
      }
    } else {
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
      });
      // print('sent data1');
      final response = await dio().post('/register',
          data: DataRegister,
          options: Options(validateStatus: ((status) => true)));
      // print('sent data2');
      print(response);

      if (response.statusCode == 200) {
        return true;
      }
    }

    return false;
  }

  Future<bool> UpdataUser(
    int UserID,
    String name,
    String last_name,
    String gender,
    File? image,
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
  ) async {
    if (image != null) {
      String filename = image.path.split('/').last;

      FormData DataUpdate = FormData.fromMap({
        'name': name,
        'last_name': last_name,
        'gender': gender,
        'image': await MultipartFile.fromFile(
          image.path,
          filename: filename,
        ),
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
      });
      // print(image.path);
      final prefs = await SharedPreferences.getInstance();
      String? token = await prefs.getString('token');
      var Token1 = token!.replaceAll('\n', '');
      var Token2 = Token1.replaceAll('\r', '');

      final response = await dio().post('/user/update/${UserID}',
          data: DataUpdate,
          options: Options(headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $Token2",
          }, validateStatus: ((status) => true)));
      // print('sent data2');
      print(response.statusCode);

      if (response.statusCode == 200) {
        GetAllUser();
        notifyListeners();
        return true;
      }

      if (response.statusCode == 401) {
        return false;
      }
    } else {
      FormData DataUpdate = FormData.fromMap({
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
      });
      // print('sent data1');
      final prefs = await SharedPreferences.getInstance();
      String? token = await prefs.getString('token');
      var Token1 = token!.replaceAll('\n', '');
      var Token2 = Token1.replaceAll('\r', '');

      final response = await dio().post('/user/update/${UserID}',
          data: DataUpdate,
          options: Options(headers: {
            "Content-Type": "application/json; charset=utf-8",
            "Authorization": "Bearer $Token2",
          }, validateStatus: ((status) => true)));
      // print('sent data2');
      print(response.statusCode);

      if (response.statusCode == 200) {
        GetAllUser();
        notifyListeners();
        return true;
      }

      if (response.statusCode == 401) {
        return false;
      }
    }

    return false;
  }

  void GetAllUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var Token2 = Token1.replaceAll('\r', '');

    final response = await dio().get('/user',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $Token2",
        }, validateStatus: ((status) => true)));

    // print(response.data);
    if (response.statusCode == 200) {
      ListUser = [];

      Map<String, dynamic> dcode = response.data;

      for (var item in dcode['user']) {
        User _listUser = User(
          id: item['id'],
          name: item['name'].toString(),
          last_name: item['last_name'].toString(),
          gender: item['gender'].toString(),
          image: item['image'].toString(),
          tel: item['tel'].toString(),
          password: '',
          birth_day: item['birth_day'].toString(),
          add_village: item['add_village'].toString(),
          add_city: item['add_city'].toString(),
          add_province: item['add_province'].toString(),
          add_detail: item['add_detail'].toString(),
          email: item['email'].toString(),
          web: item['web'].toString(),
          job: item['job'].toString(),
          job_type: item['job_type'].toString(),
          user_type: item['user_type'].toString(),
        );
        AddListUser(_listUser);
      }
      ListUserSearch = ListUser;
      notifyListeners();
    }
  }

  void SearchUser(String value) {
    print(value);
    // List<User> Search = [];
    if (value.isNotEmpty) {
      final result = ListUser.where((item) {
        final name = item.name.toLowerCase();
        final input = value.toLowerCase();
        return name.contains(input);
      }).toList();
      ListUserSearch = result;
      notifyListeners();
    } else {
      ListUserSearch = ListUser;
      notifyListeners();
    }
  }

  Future<bool> DeleteUser(int UserID) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var Token2 = Token1.replaceAll('\r', '');

    final response = await dio().delete('/user/${UserID}',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $Token2",
        }, validateStatus: ((status) => true)));

    if (response.statusCode == 200) {
      GetAllUser();
      return true;
    }

    return false;
  }
}
