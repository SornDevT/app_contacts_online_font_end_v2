import 'package:app_contact_online_font_end/Service/UserProvider.dart';
import 'package:flutter/material.dart';
import 'AdminHome.dart';
import 'Checking.dart';
import 'UserInfo.dart';
import 'Login.dart';
import 'package:provider/provider.dart';
import '../Service/AuthProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    CheckLogin();
  }

  void CheckLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    print(token);
    // Provider.of<UserProvider>(context, listen: false).GetAllUser();
    Provider.of<AuthProvider>(context, listen: false)
        .CheckAuth(token: token.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, auth, child) {
        if (auth.CheckLogin) {
          // ກວດເຊັກການ Login ຈາກ Server
          if (auth.isLoggin) {
            // ກວດຊອບວ່າ ໄດ້ເຂົ້າສູ່ລະບົບຫຼືໍ່ບໍ່
            if (auth.isAdmin) {
              // ກວດຊອບ User ເປັນ Admin ຫລືບໍ່
              return AdminHome();
            } else {
              // print(auth.user_login!.id);
              return UserInfo(
                UserID: 0,
              );
            }
          } else {
            return Login();
          }
        } else {
          return Checking();
        }
      }),
    );
  }
}
