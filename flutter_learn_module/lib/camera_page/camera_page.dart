import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/camera_page/camera_page_controller.dart';
import 'package:flutter_learn_module/gen/assets.gen.dart';
import 'package:flutter_learn_module/widget/t_image.dart';

class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraPageController _cameraController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.blue,
        ),
        Padding(
            padding: EdgeInsets.only(top: 38, left: 19),
            child: GestureDetector(
              child: TImage(Assets.image.close.path, height: 18, width: 18),
              onTap: () {
                _cameraController.onTapClose();
              },
            ))
      ],
    );
  }
}
