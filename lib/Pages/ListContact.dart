import 'package:app_contact_online_font_end/Service/ServiceSetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/AuthProvider.dart';
import '../Service/UserProvider.dart';
import 'FormAdd.dart';
import 'UserInfo.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

enum SampleItem { user_info, user_edit, user_logout }

class _ListContactState extends State<ListContact> {
  @override
  void initState() {
    super.initState();
    CheckGetUser();
  }

  void CheckGetUser() {
    Provider.of<UserProvider>(context, listen: false).GetAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, user, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('ລາຍຊື່ຜູ້ຕິດຕໍ່ ອອນໄລທ໌',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 56, 185))),
                      ),
                      PopupMenuButton<SampleItem>(
                          offset: const Offset(0, 70),
                          child:
                              (Provider.of<AuthProvider>(context, listen: false)
                                          .user_login!
                                          .image ==
                                      '')
                                  ? CircleAvatar(
                                      maxRadius: 32,
                                      backgroundColor:
                                          Color.fromARGB(255, 252, 144, 82),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://cdn-icons-png.flaticon.com/512/219/219969.png"),
                                        maxRadius: 28,
                                      ),
                                    )
                                  : CircleAvatar(
                                      maxRadius: 32,
                                      backgroundColor:
                                          Color.fromARGB(255, 252, 144, 82),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(BaseURL +
                                            'img/' +
                                            Provider.of<AuthProvider>(context,
                                                    listen: false)
                                                .user_login!
                                                .image),
                                        maxRadius: 28,
                                      ),
                                    ),
                          // onSelected: (SampleItem item) {
                          //   print('item');
                          // },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<SampleItem>>[
                                PopupMenuItem<SampleItem>(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UserInfo(
                                              UserID: Provider.of<AuthProvider>(
                                                      context,
                                                      listen: false)
                                                  .user_login!
                                                  .id),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info,
                                          color:
                                              Color.fromARGB(255, 255, 56, 185),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        // Text(Provider.of<AuthProvider>(context,
                                        //         listen: false)
                                        //     .user_login!
                                        //     .name
                                        //     .toString()),
                                        Text('ເບີ່ງຂໍ້ມູນ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 56, 185)))
                                      ],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<SampleItem>(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => FormAdd(
                                            UserID: Provider.of<AuthProvider>(
                                                    context,
                                                    listen: false)
                                                .user_login!
                                                .id,
                                            FormType: 'edit',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromARGB(255, 255, 56, 185),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('ແກ້ໄຂຂໍ້ມູນ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 56, 185)))
                                      ],
                                    ),
                                  ),
                                ),
                                PopupMenuItem<SampleItem>(
                                  child: InkWell(
                                    onTap: () {
                                      // print('object');
                                      Navigator.of(context).pop();
                                      Provider.of<AuthProvider>(context,
                                              listen: false)
                                          .LogOut();
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.logout,
                                          color:
                                              Color.fromARGB(255, 255, 56, 185),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('ອອກຈາກລະບົບ',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 255, 56, 185)))
                                      ],
                                    ),
                                  ),
                                ),
                              ])
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    onChanged: (value) {
                      Provider.of<UserProvider>(context, listen: false)
                          .SearchUser(value);
                    },
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "ຄົ້ນຫາ.......",
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(left: 20, top: 5, right: 10),
                        child: Icon(
                          Icons.search,
                          size: 35,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none)),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: user.ListUserSearch.length,
                    itemBuilder: ((context, index) {
                      return ListContact(user.ListUserSearch[index]);
                    }),
                  ),
                  // ListView(
                  //   children: [
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //     ListContact(),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget ListContact(_user) {
    // print(_user.image);
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      leading: _user.image == ''
          ? CircleAvatar(
              child: Icon(
                Icons.account_circle,
                size: 50,
              ),
              maxRadius: 30,
            )
          : CircleAvatar(
              backgroundImage: NetworkImage(BaseURL + 'img/' + _user.image),
              maxRadius: 30,
            ),
      title: Text(_user.name + ' ' + _user.last_name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_user.tel),
          Text(_user.add_village +
              ', ' +
              _user.add_city +
              ', ' +
              _user.add_province),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserInfo(UserID: _user.id),
            ),
          );
        },
        icon: Icon(
          Icons.info,
          size: 30,
          color: Color.fromARGB(255, 255, 56, 185),
        ),
      ),
    );
  }
}
