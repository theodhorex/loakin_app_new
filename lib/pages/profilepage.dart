import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/profilepagedetails.dart';
import 'package:loakin/asset/widgets/small_text.dart';
import 'package:loakin/model/user_model.dart';
import 'package:loakin/pages/catalog.dart';
import 'package:loakin/pages/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel? loggedInUser;

  Future _getUser() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      print("object");
      loggedInUser = UserModel.fromMap(value.data());
    });
    return "logged!";
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settingss()));
                },
                child: Icon(Icons.settings),
              ),
              SizedBox(
                width: 20,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      image: DecorationImage(
                          image: AssetImage("assets/image/ghozali.jpg"),
                          fit: BoxFit.cover)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          FutureBuilder(
            future: _getUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      BigText(
                          fw: FontWeight.w600,
                          text:
                              "${loggedInUser!.firstName} ${loggedInUser!.lastName}"),
                    ],
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
          SizedBox(
            height: 5,
          ),
          SmallText(
            text: "NFT Artist",
            fw: FontWeight.w400,
            color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Catalog()));
                },
                child: Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                      color: AppColors.color1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: "See Catalog",
                        fw: FontWeight.w700,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    BigText(
                      text: "230k",
                      fw: FontWeight.w300,
                      size: 15,
                    ),
                    BigText(
                      text: "Follower",
                      fw: FontWeight.w700,
                      size: 15,
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 70,
                color: Color.fromARGB(75, 0, 0, 0),
              ),
              Container(
                width: 120,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    BigText(
                      text: "4.7",
                      fw: FontWeight.w300,
                      size: 15,
                    ),
                    BigText(
                      text: "Rating",
                      fw: FontWeight.w700,
                      size: 15,
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 70,
                color: Color.fromARGB(75, 0, 0, 0),
              ),
              Container(
                width: 120,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    BigText(
                      text: "8734",
                      fw: FontWeight.w300,
                      size: 15,
                    ),
                    BigText(
                      text: "Post",
                      fw: FontWeight.w700,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 45,
                  ),
                  BigText(
                    text: "About This Shop",
                    fw: FontWeight.w700,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 300,
                  height: 200,
                  child: Text(
                    "Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet,Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    textAlign: TextAlign.justify,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
