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
                width: 350,
                height: 40,
                decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.circular(7)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Sign Out",
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.arrow_right,
                      color: Colors.white,
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
