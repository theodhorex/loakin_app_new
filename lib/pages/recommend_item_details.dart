import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/app_icon.dart';
import 'package:loakin/asset/widgets/big_text.dart';

import '../asset/widgets/icon_and_text_widget_detail.dart';

class RecommendItemDetails extends StatelessWidget {
  const RecommendItemDetails({Key? key}) : super(key: key);

  // By Dion
  // collection("Your Collection").docs("Your ID").get().then((Event){});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> postingan =
        FirebaseFirestore.instance.collection('postingan').snapshots();
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: postingan,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Error Tod");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading Bodat");
            }

            final data = snapshot.requireData;
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppIcon(
                            icon: Icons.shopping_cart_outlined,
                            iconColor: Colors.white),
                      ],
                    ),
                    pinned: true,
                    backgroundColor: AppColors.color1,
                    expandedHeight: 500,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/image/dg-balls.jpg",
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Container(
                          height: 800,
                          child: Center(
                            child: IconAndTextDetail(
                                title:
                                    "Kaktus Busuk Versi 2.3.2 Retro Production Special Edition Year 3012 Made By UFO",
                                price: 30000,
                                user: "Theodhore"),
                          )))
                ],
              ),
              bottomNavigationBar: Container(
                height: Dimensions.bottomHeightNavBar,
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 236, 236, 236)),
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
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius5),
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
          }),
    );
  }
}
