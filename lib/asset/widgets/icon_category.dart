import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/colors.dart';
import 'package:loakin/asset/dimensions.dart';
import 'package:loakin/asset/widgets/small_text.dart';

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color bgColor;
  final double iconSize;
  final String text;
  const CategoryIcon({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
    required this.iconSize,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          child: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: bgColor),
        ),
        SizedBox(
          height: 7,
        ),
        SmallText(
          text: text.toUpperCase(),
          color: Color.fromARGB(255, 121, 116, 116),
        )
      ],
    );
  }
}
