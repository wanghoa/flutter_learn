import 'dart:io';

import 'package:flutter/cupertino.dart';

///内部判断 image来源（做了一层封装）：是来自asset还是file或memory，network
class TImage extends StatelessWidget {
  double? width;
  double? height;
  final String url;

  // url 必传，其他参数可选 使用{}
  TImage(this.url, {this.width, this.height});

  @override
  Widget build(BuildContext context) {
    if (url.contains('asset')) {
      return Image.asset(url, width: width, height: height);
    } else {
      return Image.file(File(url), width: width, height: height);
    }
  }
}
