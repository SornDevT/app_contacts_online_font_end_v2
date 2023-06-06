import 'package:flutter/material.dart';
import 'Dio.dart';
import 'package:dio/dio.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggin = false; // ກວດຊອບການເຂົ້້າສູ່ລະບົບ
  String? _token; // ເອົາໄວ້ເກັບ token
  bool CheckLogin = false; // ໂຕແປເອົາໄວ້ສະແດງໜ້າກວດຊອງການ Login
  bool isAdmin = true; // ເຊັກວ່າແມ່ນ Admin ຫຼືບໍ່

  void CheckAuth({required String token}) async {
    CheckLogin = false;
    notifyListeners();
    var Token1 = token.replaceAll('\n', '');
    var Token2 = Token1.replaceAll('\r', '');

    final response = await dio().get('/user',
        options: Options(headers: {
          "Content-Type": "application/json; charset=utf-8",
          "Authorization": "Bearer $Token2",
        }, validateStatus: ((status) => true)));

    if (response.statusCode == 200) {
      isLoggin = true;
      CheckLogin = true;
      notifyListeners();
    } else {
      isLoggin = false;
      CheckLogin = true;
      notifyListeners();
    }
  }
}
