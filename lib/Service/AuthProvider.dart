import 'dart:convert';

import 'package:flutter/material.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggin = false; // ກວດຊອບການເຂົ້້າສູ່ລະບົບ
  String? _token; // ເອົາໄວ້ເກັບ token
  bool CheckLogin = false; // ໂຕແປເອົາໄວ້ສະແດງໜ້າກວດຊອງການ Login
  bool isAdmin = false; // ເຊັກວ່າແມ່ນ Admin ຫຼືບໍ່
  String? message_login;
  User? user_login;
  bool Show_ms_login = false;

  void CheckAuth({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    CheckLogin = false;
    notifyListeners();
    var Token1 = token.replaceAll('\n', '');
    var Token2 = Token1.replaceAll('\r', '');

    final response = await dio().get('/check_user',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $Token2",
        }, validateStatus: ((status) => true)));

    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.data);

      Map<String, dynamic> decode_user = response.data['user'];
      user_login = await User.fromJson(decode_user);

      // notifyListeners();
      // print(response.data['user']);

      isAdmin = (await prefs.getBool('isAdmin'))!;
      // print(isAdmin);
      isLoggin = true;
      CheckLogin = true;
      notifyListeners();
    } else {
      isLoggin = false;
      CheckLogin = true;
      notifyListeners();
    }
  }

  Future<bool> LoginAuth(Tel, Password) async {
    Map creds = {
      'tel': Tel,
      'password': Password,
    };

    final response = await dio().post('/login',
        data: creds, options: Options(validateStatus: ((status) => true)));
    // print(response.data['authorisation']['token']);
    print(response.data);

    if (response.data['success'] == false) {
      // print('No login');
      Show_ms_login = true;
      message_login = response.data['message'];
      notifyListeners();
    } else {
      Show_ms_login = false;
      message_login = null;
      notifyListeners();
    }

    if (response.statusCode == 200) {
      String token = response.data['authorisation']['token'].toString();
      await saveToken(token);

      // save user type
      final prefs = await SharedPreferences.getInstance();
      // print(response.data['user']);
      if (response.data['user']['user_type'] == 'admin') {
        isAdmin = true;
        await prefs.setBool('isAdmin', isAdmin);
      } else {
        isAdmin = false;
        await prefs.setBool('isAdmin', isAdmin);
      }
      print(response.data['user']);
      Map<String, dynamic> decode_user = response.data['user'];
      user_login = User.fromJson(decode_user);
      _token = token;
      isLoggin = true;
      notifyListeners();
      return true;
    }

    return false;
  }

  Future<bool> LogOut() async {
    CheckLogin = true;

    /// ສະແດງໜ້າກວດຊອບ Server
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    var Token1 = token!.replaceAll('\n', '');
    var Token2 = Token1.replaceAll('\r', '');

    final response = await dio().get('/logout',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $Token2",
        }, validateStatus: ((status) => true)));

    if (response.statusCode == 200) {
      cleanUp();
      return true;
    }

    return false;
  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  cleanUp() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggin = false;
    _token = null;
    print('Logout and Clean');
    await prefs.remove('token');
    notifyListeners();
  }
}
