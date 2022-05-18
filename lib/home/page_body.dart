import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/icon_category.dart';
import 'package:loakin/asset/widgets/item_list_page.dart';
import 'package:loakin/home/recommend_item.dart';
import 'package:loakin/model/user_model.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  final Stream<QuerySnapshot> postingan =
      FirebaseFirestore.instance.collection('postingan').snapshots();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: Dimensions.width25, top: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [BigText(text: "Explore Loakin")],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 25),
            width: 370,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5))
                ]),
            child: PageView.builder(
              itemCount: 2,
              itemBuilder: (context, position) {
                return CategoryItem();
              },
            )),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 20),
              child: Row(
                children: [BigText(text: "Recommended For You")],
              ),
            ),
            Container(
              child: StreamBuilder<QuerySnapshot>(
                stream: postingan,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error Tod");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading Bodat");
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return ListPage(
                        image: "assets/image/dg-balls.jpg",
                        title: "${data.docs[index]['title']}",
                        price: "${data.docs[index]['price']}",
                        cond: "New",
                        user: "Theodhore.com",
                      );
                    },
                  );
                },
              ),
            )
          ],
        )
      ],
    );
  }
}

// Category Page With Slider
class CategoryItem extends StatefulWidget {
  const CategoryItem({Key? key}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CategoryIcon(
                icon: Icons.chair,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Perabotan",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              CategoryIcon(
                icon: Icons.chair,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Perabotan",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
              SizedBox(
                width: 20,
              ),
              CategoryIcon(
                icon: Icons.phone_android,
                iconColor: Colors.white,
                bgColor: AppColors.color1,
                iconSize: 20,
                text: "Elektronik",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
