import 'package:flutter/cupertino.dart';

class TextCount extends StatelessWidget {
  // 2种文本 文字与数字 text ; num
  final text;
  final textStyle;
  final String num;
  final numStyle;

  TextCount(this.text, this.num, {this.textStyle = const TextStyle(

      color: Color(0xff747379),
      fontSize: 13,
      decoration: TextDecoration
          .none), this.numStyle = const TextStyle(
      color: Color(0xff151920), fontSize: 13, decoration: TextDecoration.none)});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(text, style: textStyle),
      SizedBox(height: 3),
      Text(num, style: numStyle)
    ]);
  }
}