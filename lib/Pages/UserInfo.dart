import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/UserProvider.dart';
import '../Model/User.dart';
import 'FormAdd.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key, required this.UserID}) : super(key: key);
  final int UserID;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> with TickerProviderStateMixin {
  late TabController _tabController;

  User? UserData;

  void GetUserData() {
    List<User> listUser =
        Provider.of<UserProvider>(context, listen: false).ListUser;
    UserData = listUser.firstWhere((i) => i.id == widget.UserID);
  }

  @override
  void initState() {
    super.initState();
    GetUserData();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text('ຂໍ້ມູນສະມາຊິກ',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 56, 185))),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormAdd(UserID: widget.UserID),
                  ),
                );
              },
              icon: Icon(
                Icons.edit,
                size: 28,
                color: Color.fromARGB(255, 255, 56, 185),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Align(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20, top: 110),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3)),
                      ],
                    ),
                    child: Wrap(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'ສະຖານະ: ${UserData?.user_type}',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.orange),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          UserData?.gender == 'male'
                              ? Text(
                                  'ທ່ານ ${UserData?.name} ${UserData?.last_name}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 56, 185),
                                  ),
                                )
                              : Text(
                                  'ທ່ານ ນ ${UserData?.name} ${UserData?.last_name}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 56, 185),
                                  ),
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('ວັນເດືອນປີເກີດ: ${UserData?.birth_day}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45)),
                          const SizedBox(
                            height: 20,
                          ),
                          TabBar(
                              controller: _tabController,
                              labelColor: Color.fromARGB(255, 255, 56, 185),
                              labelStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              indicatorColor: Color.fromARGB(255, 255, 56, 185),
                              indicatorWeight: 3,
                              // indicatorSize: TabBarIndicatorSize.label,
                              tabs: const [
                                Tab(
                                  text: 'ທີ່ຢູ່',
                                ),
                                Tab(
                                  text: 'ຕິດຕໍ່',
                                ),
                                Tab(
                                  text: 'ອາຊີບ',
                                ),
                              ])
                        ],
                      )
                    ]),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: TabBarView(controller: _tabController, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ບ້ານ: ${UserData?.add_village}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ເມືອງ: ${UserData?.add_city}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ແຂວງ: ${UserData?.add_province}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ລາຍລະອຽດເພີ່ມເຕີມ: ${UserData?.add_detail}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ເບີໂທ: +85620 ${UserData?.tel}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ອີເມວລ໌: ${UserData?.email}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ເວັບໄຊທ໌: ${UserData?.web}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ອາຊີບ: ${UserData?.job}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'ຕຳແໜ່ງ: ${UserData?.job_type}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ]),
                ))
              ],
            ),
          ),
          Positioned(
              top: 10,
              left: 40,
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 56, 185),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 62,
                ),
                maxRadius: 65,
              ))
        ],
      ),
    );
  }
}
