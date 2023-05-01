import 'package:flutter_learn_module/channel_util.dart';
import 'package:get/get.dart';

class CameraPageController extends GetxController {
  void onTapClose() {
// 调用MethodChannel 通知Native 关闭flutter 容器
    ChannelUtil.closeCamera();
  }
}
