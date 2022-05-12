import 'package:flutter/material.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/small_text.dart';
import 'package:intl/intl.dart';
import 'package:loakin/pages/recommend_item_detail.dart';
import 'package:loakin/pages/recommend_item_details.dart';

class ListPage extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String cond;
  final String user;

  const ListPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.price,
      required this.cond,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
          child: InkWell(
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecommendItemDetails(),
              ));
        }),
        child: Column(
          children: [
            Container(
              height: 160,
              width: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(image))),
            ),
            Container(
              height: 100,
              width: 160,
              padding: EdgeInsets.only(top: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 125,
                        child: BigText(
                          text: title,
                          overFlow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 5,
                            child: Icon(Icons.bookmark_outline),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      BigText(
                        text: price,
                        fw: FontWeight.w800,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                        text: user,
                        color: Colors.black,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
