import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/UserProvider.dart';
import 'ListContact.dart';
import 'FormAdd.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  //int _selectedIndex = 0;

  static const List<Widget> _widgetOption = <Widget>[
    ListContact(),
    FormAdd(
      UserID: 0,
      FormType: 'add',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, user, child) {
      return Scaffold(
        body: _widgetOption.elementAt(user.AdminPage),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: user.AdminPage,
          backgroundColor: Color.fromARGB(255, 255, 56, 185),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.list), label: 'ລາຍການສະມາຊິກ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.plus_one), label: 'ເພີ່ມສະມາຊິກ'),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[400],
          onTap: _onItemTapped,
        ),
      );
    });
  }

  void _onItemTapped(int index) {
    // print(index);
    Provider.of<UserProvider>(context, listen: false).SetAdminPage(index);
  }
}
