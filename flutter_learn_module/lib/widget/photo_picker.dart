import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/main.dart';
import 'package:image_picker/image_picker.dart';

import 't_image.dart';

///展示完整图片; 提供切换图片功能
class PhotoPickerPage extends StatelessWidget {

  final String fileUrl;
  final double? height;
  final double? width;


  PhotoPickerPage(this.fileUrl, {this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment.center,
        child: GestureDetector(
          child: TImage(fileUrl, height: height, width: width),
          onTap: () {
            router.popRoute();
          },
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(padding: EdgeInsets.only(bottom: 85),
          child: GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Color(0xff2626262),
              width: 190,
              height: 36,
              child: Text('更换背景', style: TextStyle(color: Colors.white70,
                  fontSize: 14,
                  decoration: TextDecoration.none)),

            ), onTap: () async {
            var pickerFile = await ImagePicker().pickImage(
                source: ImageSource.gallery);
            var path = pickerFile?.path;
            if (path != null) {
              router.popRoute(params: path);
            }
          },),),)
    ],);
  }
}
