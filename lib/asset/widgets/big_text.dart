import 'package:flutter/cupertino.dart';
import 'package:loakin/asset/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow? overFlow;
  FontWeight? fw;
  double? fs;

  BigText(
      {Key? key,
      this.color = const Color.fromARGB(255, 26, 28, 32),
      this.size = 17,
      this.overFlow,
      required this.text,
      this.fw,
      this.fs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overFlow,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimensions.font20 : size,
          color: color,
          fontWeight: fw),
    );
  }
}
