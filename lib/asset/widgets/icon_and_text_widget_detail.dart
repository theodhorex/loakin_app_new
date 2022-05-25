import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/app_icon.dart';
import 'package:loakin/asset/widgets/big_text.dart';
import 'package:loakin/asset/widgets/small_text.dart';

class IconAndTextDetail extends StatelessWidget {
  final String title;
  final int price;
  final String user;

  const IconAndTextDetail(
      {Key? key, required this.title, required this.price, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 335,
                padding: EdgeInsets.only(left: 15),
                child: BigText(
                  text: title,
                  size: 19,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 17)),
              BigText(
                text: NumberFormat.currency(locale: 'id', symbol: 'Rp ')
                    .format(price),
                fw: FontWeight.w800,
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 17)),
              BigText(text: "Deskripsi"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 18,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    AppIcon(
                        icon: Icons.access_time_outlined,
                        iconColor: Color.fromARGB(193, 0, 0, 0)),
                    SmallText(
                      text: "oleh Theodhore Riyanto",
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 18,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    AppIcon(
                        icon: Icons.crop_3_2_outlined,
                        iconColor: Color.fromARGB(193, 0, 0, 0)),
                    SmallText(
                      text: "Brand New",
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 18,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    AppIcon(
                        icon: Icons.note,
                        iconColor: Color.fromARGB(193, 0, 0, 0)),
                    SmallText(
                      text: "OK",
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 17)),
              BigText(text: "Metode Pembayaran"),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                height: 18,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    AppIcon(
                        icon: Icons.handshake,
                        iconColor: Color.fromARGB(193, 0, 0, 0)),
                    SmallText(
                      text: "COD",
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 18,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 5)),
                    AppIcon(
                        icon: Icons.location_on,
                        iconColor: Color.fromARGB(193, 0, 0, 0)),
                    SmallText(
                      text: "Semarang",
                      color: Colors.black,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // Row(
          //   children: [
          //     Padding(padding: EdgeInsets.only(left: 17)),
          //     BigText(text: "Meet The Seller"),
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
