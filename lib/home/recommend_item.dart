// List Item With Image Below Category
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:loakin/asset/dimensions.dart';

import '../../asset/widgets/item_list_page.dart';

class RecommendItem extends StatefulWidget {
  const RecommendItem({Key? key}) : super(key: key);

  @override
  State<RecommendItem> createState() => _RecommendItemState();
}

class _RecommendItemState extends State<RecommendItem> {
  final Stream<QuerySnapshot> postingan =
      FirebaseFirestore.instance.collection('postingan').snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        StreamBuilder<QuerySnapshot>(
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

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return ListPage(
                  image: "assets/image/dg-balls.jpg",
                  title: "${data.docs[index]['title']}",
                  price: "30000",
                  cond: "New",
                  user: "Theodhore.com",
                );
              },
            );
          },
        ),
      ]),
    );
  }
}
