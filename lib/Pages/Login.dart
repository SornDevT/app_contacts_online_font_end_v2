import 'package:app_contact_online_font_end/Pages/Register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Service/AuthProvider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _seepass = true;
  bool _pressLogin = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _Tel = TextEditingController();
  TextEditingController _Password = TextEditingController();

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
              child: Padding(
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
                            'ສະບາຍດີ, ຍິນດີຕ້ອນຮັບ',
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
                      const Text('ເບີໂທລະສັບ:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 56, 185))),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: _Tel,
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          hintText: ".......",
                          prefixIcon: const Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: 12, right: 10),
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
                            return 'ກະລຸນາປ້ອນເບີໂທ';
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
                        controller: _Password,
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
                            contentPadding: const EdgeInsets.only(left: 25)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'ກະລຸນາປ້ອນລະຫັດຜ່ານ';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      if (Provider.of<AuthProvider>(context, listen: false)
                          .Show_ms_login)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Provider.of<AuthProvider>(context, listen: false)
                                  .message_login
                                  .toString(),
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: _pressLogin
                            ? Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      Color.fromARGB(255, 255, 56, 185)),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // set loading
                                    setState(() {
                                      _pressLogin = true;
                                    });

                                    bool result =
                                        await Provider.of<AuthProvider>(context,
                                                listen: false)
                                            .LoginAuth(
                                                _Tel.text, _Password.text);

                                    if (!result) {
                                      setState(() {
                                        _pressLogin = false;
                                      });
                                    }
                                  }
                                },
                                child: Text('ເຂົ້າສູ່ລະບົບ',
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
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text('ບໍ່ມີບັຊີຜູ້ໃຊ້,'),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: const Text(
                              'ລົງທະບຽນ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 56, 185)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
