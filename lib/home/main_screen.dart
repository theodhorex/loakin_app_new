import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/app_icon.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/small_text.dart';
import 'package:loakin/home/page_body.dart';
import 'package:loakin/home/item_page_body.dart';
import 'package:loakin/home/recommend_item.dart';
import 'package:loakin/pages/profilepage.dart';
import 'package:loakin/pages/recommend_item_details.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width25, right: Dimensions.width25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Indonesia",
                      color: AppColors.color1,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: Dimensions.width6)),
                        SmallText(
                          text: "Semarang",
                          color: AppColors.color2,
                        ),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.color1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.color1),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        height: 45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.color1),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // ItemPageBody(),
        Expanded(
            child: SingleChildScrollView(
          child: PageBody(),
        ))
      ],
    ));
  }
}
