import 'package:flutter/material.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/item_list_page.dart';
import 'package:loakin/asset/widgets/small_text.dart';
import 'package:loakin/pages/profilepage.dart';

class Catalog extends StatefulWidget {
  const Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Container(
              height: 660,
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat"),
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat"),
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat")
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat"),
                      ListPage(
                          image: "assets/image/dg-balls.jpg",
                          title: "Example",
                          price: "100000",
                          cond: "Brand New",
                          user: "Bodat")
                    ],
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
