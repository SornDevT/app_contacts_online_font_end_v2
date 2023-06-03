import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  bool _seepass = true;
  bool _seepass2 = true;
  bool _check_pass = false;
  String Gender = 'male';

  TextEditingController _name = TextEditingController();
  TextEditingController _last_name = TextEditingController();
  TextEditingController _birth_day = TextEditingController();
  TextEditingController _tel = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirm_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              color: Color.fromARGB(255, 255, 56, 185),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'ລົງທະບຽນສະມາຊິກໃໝ່',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 56, 185)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          const Text('ຊື່:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 56, 185))),
                          const SizedBox(
                            height: 30,
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
                                return 'ກະລຸນາປ້ອນຊື່....';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ນຍາມສະກຸນ:',
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
                                return 'ກະລຸນາປ້ອນນາມສະກຸນ....';
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
                                      color:
                                          Color.fromARGB(255, 255, 56, 185))),
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
                                      color:
                                          Color.fromARGB(255, 255, 56, 185))),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Text('ອີເມວລ໌:',
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
                                return 'ກະລຸນາປ້ອນ ອີເມວລ໌....';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text('ເບີໂທລະສັບ:',
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
                                padding: EdgeInsets.only(
                                    left: 20, top: 12, right: 10),
                                child: Text(
                                  '+85620',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black45),
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
                                return 'ກະລຸນາປ້ອນເບີໂທ....';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text(
                            'ລະຫັດຜ່ານ:',
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
                                return 'ກະລຸນາປ້ອນ ລະຫັດຜ່ານ....';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const Text(
                            'ຍືນຍັນລະຫັດຜ່ານ:',
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
                                return 'ກະລຸນາປ້ອນ ຍືນຍັນລະຫັດຜ່ານ....';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          if (_check_pass)
                            Container(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ລະຫັດຜ່ານບໍ່ກົງກັນ ກະລຸນາກວດຄືນ!',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_password.text ==
                                      _confirm_password.text) {
                                    setState(() {
                                      _check_pass = false;
                                    });
                                    print('form pass ok');
                                    print(_name.text);
                                  } else {
                                    setState(() {
                                      _check_pass = true;
                                    });
                                  }
                                }
                              },
                              child: Text('ລົງທະບຽນ',
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
