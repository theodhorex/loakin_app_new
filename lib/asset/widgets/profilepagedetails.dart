import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/user_model.dart';
import 'big_text.dart';

class ProfilePageDetails extends StatefulWidget {
  const ProfilePageDetails({Key? key}) : super(key: key);

  @override
  State<ProfilePageDetails> createState() => _ProfilePageDetailsState();
}

class _ProfilePageDetailsState extends State<ProfilePageDetails> {
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
    return FutureBuilder(
        future: _getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Column(
                children: [
                  BigText(text: "Welcome Back!"),
                  BigText(
                      text:
                          "${loggedInUser!.firstName} ${loggedInUser!.lastName}"),
                  BigText(text: "${loggedInUser!.email}")
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
