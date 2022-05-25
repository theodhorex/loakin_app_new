import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/pages/signin.dart';

class Settingss extends StatefulWidget {
  const Settingss({Key? key}) : super(key: key);

  @override
  State<Settingss> createState() => _SettingssState();
}

class _SettingssState extends State<Settingss> {
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: _signOut,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 241, 241, 241),
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                            color: AppColors.color1,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BigText(
                            text: "Keluar",
                            color: Color.fromARGB(255, 77, 77, 77),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 160, 160, 160),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
