import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/pages/signin.dart';
import 'package:loakin/pages/signup.dart';

class AfterSplash extends StatefulWidget {
  const AfterSplash({Key? key}) : super(key: key);

  @override
  State<AfterSplash> createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  var _currPageValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  child: Text(
                    "Pakai Loakin, temukan barang impianmu dengan mudah!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: 450,
              height: 450,
              child: Image(
                  image: AssetImage("assets/image/main_screen_loakin.png")),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.color1,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BigText(
                      text: "Gabung Sekarang",
                      color: Colors.white,
                      fw: FontWeight.w600,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: BigText(
                      text: "Lewati",
                      fw: FontWeight.w600,
                      size: 18,
                      color: Color.fromARGB(255, 107, 107, 107),
                    ),
                  ),
                  InkWell(
                    child: BigText(
                      text: "",
                      fw: FontWeight.w800,
                      size: 18,
                      color: AppColors.color1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
