import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  TextOverflow overflow;
  FontWeight? fw;

  SmallText(
      {Key? key,
      this.fw,
      this.color = const Color.fromARGB(255, 255, 213, 205),
      this.size = 12,
      this.overflow = TextOverflow.ellipsis,
      required this.text,
      this.height = 1.1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size,
          color: color,
          overflow: overflow,
          fontWeight: fw == FontWeight.w600 ? fw : fw),
    );
  }
}
