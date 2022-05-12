import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/app_icon.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/icon_and_text_widget_detail.dart';

class RecommendItemDetail extends StatelessWidget {
  const RecommendItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              right: 0,
              left: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.recommendFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/dg-balls.jpg"))),
              )),
          Positioned(
              top: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios_new_outlined,
                    iconColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                  AppIcon(
                    icon: Icons.share_rounded,
                    iconColor: Color.fromARGB(255, 255, 255, 255),
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.recommendFoodImgSize,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: IconAndTextDetail(
                  title:
                      "Kaktus Busuk Versi 2.3.2 Retro Production Special Edition Year 3012 Made By UFO",
                  price: 30000,
                  user: "Theodhore"),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightNavBar,
        padding: EdgeInsets.only(
            top: Dimensions.height20,
            bottom: Dimensions.height20,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(color: Color.fromARGB(255, 236, 236, 236)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 5,
              child: Icon(
                Icons.bookmark_outline,
                size: 30,
              ),
            ),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius5),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: "Chat",
                    fw: FontWeight.w700,
                  )
                ],
              ),
            ),
            Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius5),
                  color: AppColors.color1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: "Make Offer",
                    color: Colors.white,
                    fw: FontWeight.w700,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
