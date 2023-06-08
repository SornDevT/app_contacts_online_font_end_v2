import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/AuthProvider.dart';

class ListContact extends StatefulWidget {
  const ListContact({super.key});

  @override
  State<ListContact> createState() => _ListContactState();
}

enum SampleItem { user_info, user_edit, user_logout }

class _ListContactState extends State<ListContact> {
  @override
  Widget build(BuildContext context) {
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
                      child: CircleAvatar(
                        maxRadius: 32,
                        backgroundColor: Color.fromARGB(255, 252, 144, 82),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/219/219969.png"),
                          maxRadius: 28,
                        ),
                      ),
                      // onSelected: (SampleItem item) {
                      //   print('item');
                      // },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<SampleItem>>[
                            PopupMenuItem<SampleItem>(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.info,
                                    color: Color.fromARGB(255, 255, 56, 185),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('ເບີ່ງຂໍ້ມູນ',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 56, 185)))
                                ],
                              ),
                            ),
                            PopupMenuItem<SampleItem>(
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.edit,
                                    color: Color.fromARGB(255, 255, 56, 185),
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
                                      color: Color.fromARGB(255, 255, 56, 185),
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
              child: ListView(
                children: [
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                  ListContact(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListContact() {
    return ListTile(
      contentPadding: const EdgeInsets.all(5),
      leading: CircleAvatar(
        maxRadius: 30,
      ),
      title: Text('ທ່ານ ສົມພອນ ແສງພະໄຊ'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('020 2233445566'),
          Text(
            'ບ້ານ ໜອງແມງດາ, ເມືອງໄຊ, ແຂວງອຸດົມໄຊ',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.info,
          size: 30,
          color: Color.fromARGB(255, 255, 56, 185),
        ),
      ),
    );
  }
}
