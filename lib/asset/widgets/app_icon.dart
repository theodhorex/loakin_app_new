import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loakin/asset/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final double iconSize;
  const AppIcon(
      {Key? key,
      required this.icon,
      required this.iconColor,
      this.backgroundColor,
      this.iconSize = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconSize,
      height: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(iconSize / 2),
        // color: backgroundColor
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: Dimensions.iconSize24,
      ),
    );
  }
}
