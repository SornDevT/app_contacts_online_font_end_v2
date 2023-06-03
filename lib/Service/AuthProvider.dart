import 'package:flutter/material.dart';
import 'Dio.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggin = false; // ກວດຊອບການເຂົ້້າສູ່ລະບົບ
  String? _token; // ເອົາໄວ້ເກັບ token
  bool CheckLogin = false; // ໂຕແປເອົາໄວ້ສະແດງໜ້າກວດຊອງການ Login
  bool isAdmin = true; // ເຊັກວ່າແມ່ນ Admin ຫຼືບໍ່
}
