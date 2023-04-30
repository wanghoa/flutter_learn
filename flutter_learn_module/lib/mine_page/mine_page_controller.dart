import 'package:get/get.dart';

import '../gen/assets.gen.dart';

// GetX 改造步骤2，继承GetController
class MinePageController extends GetxController {
  //GetX 改造步骤3 给变量添加 .obs
  var _backgroundUrl = Assets.image.defaultPhoto.path.obs;

  String get backgroundUrl => _backgroundUrl.value;

  set backgroundUrl(String url) => _backgroundUrl.value = url;
}
