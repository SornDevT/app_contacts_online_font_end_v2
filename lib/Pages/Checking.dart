import 'package:flutter/material.dart';

class Checking extends StatelessWidget {
  const Checking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Color.fromARGB(255, 255, 56, 185)),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'ກຳລັງກວດຊອບຂໍ້ມູນ.... ຈາກ Server',
              style: TextStyle(color: Color.fromARGB(255, 255, 56, 185)),
            )
          ],
        ),
      ),
    );
  }
}
