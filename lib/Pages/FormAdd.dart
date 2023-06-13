import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/UserProvider.dart';
import '../Model/User.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  User? UserData;

  final _formKey = GlobalKey<FormState>();
  bool _check_pass = false;
  bool _pressAdd = false;
  bool _seepass = true;
  bool _seepass2 = true;

  String Gender = 'male';

  TextEditingController _name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _birth_day = TextEditingController();
  TextEditingController _tel = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();
  TextEditingController _job = TextEditingController();
  TextEditingController _job_type = TextEditingController();
  TextEditingController _add_village = TextEditingController();
  TextEditingController _add_city = TextEditingController();
  TextEditingController _add_province = TextEditingController();
  TextEditingController _add_detail = TextEditingController();
  TextEditingController _web = TextEditingController();

  // ອັບໂຫຼດຮູບ
  String? imageFilePath;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text('ເພີ່ມສະມາຊິກໃໝ່',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 56, 185))),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 56, 185),
                    maxRadius: 90,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      maxRadius: 88,
                      child: Icon(
                        Icons.add,
                        size: 50,
                        color: Color.fromARGB(255, 255, 56, 185),
                      ),
                    ))
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Text('ຂໍ້ມູນສ່ວນຕົວ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 56, 185))),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3)),
                    ]),
                child: Wrap(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('ຊື່:(*)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _name,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນຊື່...';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ນາມສະກຸນ:(*)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _last_name,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນ ນາມສະກຸນ...';
                        }
                      },
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'male',
                            groupValue: Gender,
                            onChanged: (value) {
                              setState(() {
                                Gender = value!;
                              });
                            }),
                        const Text('ຊາຍ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 56, 185))),
                        SizedBox(
                          width: 20,
                        ),
                        Radio(
                            value: 'female',
                            groupValue: Gender,
                            onChanged: (value) {
                              setState(() {
                                Gender = value!;
                              });
                            }),
                        const Text('ຍິງ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 56, 185))),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('ວັນເດືອນປີເກີດ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _birth_day,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const Text('ອີເມວລ໌:(*)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນອີເມວລ໌...';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ເວັບໄຊທ໌:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _web,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ເບີໂທລະສັບ:(*)',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _tel,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        prefixIcon: const Padding(
                          padding:
                              EdgeInsets.only(left: 20, top: 12, right: 10),
                          child: Text(
                            '+85620',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black45),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.none)),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນເບີໂທ...';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'ລະຫັດຜ່ານ:(*)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 56, 185),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _password,
                      obscureText: _seepass,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _seepass = !_seepass;
                              });
                            },
                            icon: _seepass
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                        hintText: ".......",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.none)),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ...';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'ຍືນຍັນລະຫັດຜ່ານ:(*)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 56, 185),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _confirm_password,
                      obscureText: _seepass2,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _seepass2 = !_seepass2;
                              });
                            },
                            icon: _seepass2
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                        hintText: ".......",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                                style: BorderStyle.none)),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'ກະລຸນາປ້ອນຍືນຍັນລະຫັດຜ່ານ...';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    //   child: ElevatedButton(
                    //     onPressed: () {},
                    //     child: Text('ລົງທະບຽນ',
                    //         style: TextStyle(
                    //           fontSize: 20,
                    //           fontWeight: FontWeight.bold,
                    //         )),
                    //     style: ElevatedButton.styleFrom(
                    //         padding: const EdgeInsets.all(15),
                    //         shape: const RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(50),
                    //           ),
                    //         ),
                    //         primary: Color.fromARGB(255, 255, 56, 185)),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Text('ຂໍ້ມູນອາຊີບ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 56, 185))),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3)),
                    ]),
                child: Wrap(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('ຊື່ບ່ອນເຮັດວຽກ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _job,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ຕຳແໜ່ງ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    TextFormField(
                      controller: _job_type,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(right: 30, left: 30),
              child: Text('ຂໍ້ມູນທີ່ຢູ່',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 56, 185))),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3)),
                    ]),
                child: Wrap(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text('ບ້ານ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _add_village,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ເມືອງ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _add_city,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ແຂວງ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _add_province,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Text('ລາຍລະອຽດເພີ່ມເຕີມ:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 56, 185))),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      controller: _add_detail,
                      // keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        hintText: ".......",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: const BorderSide(
                              width: 1,
                              color: Colors.grey,
                              style: BorderStyle.none),
                        ),
                        contentPadding: const EdgeInsets.all(20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (_check_pass)
              Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ລະຫັດຜ່ານບໍ່ກົງກັນ ກະລຸນາກວດຄືນ!',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 0),
              child: SizedBox(
                width: double.infinity,
                child: _pressAdd
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                            Color.fromARGB(255, 255, 56, 185),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_password.text == _confirm_password.text) {
                              setState(() {
                                _check_pass = false;
                                _pressAdd = true;
                              });

                              bool result = await Provider.of<UserProvider>(
                                      context,
                                      listen: false)
                                  .RegisterUser(
                                      _name.text,
                                      _last_name.text,
                                      Gender,
                                      '',
                                      _tel.text,
                                      _password.text,
                                      _birth_day.text,
                                      _add_village.text,
                                      _add_city.text,
                                      _add_province.text,
                                      _add_detail.text,
                                      _email.text,
                                      _web.text,
                                      _job.text,
                                      _job_type.text);

                              print(result);

                              if (result) {
                                setState(() {
                                  _pressAdd = false;
                                });
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .SetAdminPage(0);
                              }

                              // print('form pass ok');
                              // print(_name.text);
                            } else {
                              setState(() {
                                _check_pass = true;
                              });
                            }
                          }
                        },
                        child: Text('ບັນທຶກຂໍ້ມູນ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            primary: Color.fromARGB(255, 255, 56, 185)),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
