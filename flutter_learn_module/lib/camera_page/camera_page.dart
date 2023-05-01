import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/camera_page/camera_page_controller.dart';
import 'package:flutter_learn_module/gen/assets.gen.dart';
import 'package:flutter_learn_module/widget/t_image.dart';
import 'package:get/get.dart';

class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraPageController _cameraController;
  late CameraController _cameraControllerNative;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraPageController();
    _cameraController.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            child: Obx(() {
              return _cameraController.cameraController == null ||
                      !_cameraController.cameraController!.value.isInitialized
                  ? Container(color: Colors.black)
                  : CameraPreview(_cameraController.cameraController!);
            })),
        Padding(
            padding: EdgeInsets.only(top: 38, left: 19),
            child: GestureDetector(
              child: TImage(Assets.image.close.path, height: 18, width: 18),
              onTap: () {
                _cameraController.onTapClose();
              },
            )),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 35, right: 14),
            child: Column(
              children: [
                _buildIcon(Assets.image.close.path, '翻转',
                    () => _cameraController.onSwitchCamera()),
                SizedBox(height: 16),
                _buildIcon(
                    Assets.image.close.path,
                    '倒计时',
                    () => Future.delayed(Duration(seconds: 3),
                        () => _cameraController.takePhotoAndUpload())),
                SizedBox(height: 16),
                Obx(() => _buildIcon(
                    _cameraController.flash
                        ? Assets.image.close.path
                        : Assets.image.close.path,
                    '闪光灯',
                    () => _cameraController.onSwitchCamera()))
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildIcon(String iconPath, String title, GestureTapCallback onTap) {
    return GestureDetector(
        child: Column(children: [
          TImage(
            iconPath,
            width: 25,
            height: 25,
          ),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  decoration: TextDecoration.none))
        ]),
        onTap: onTap);
  }
}
