import 'package:flutter_learn_module/main.dart';
import 'package:flutter_learn_module/mc_router.dart';
import 'package:get/get.dart';

import '../gen/assets.gen.dart';

// GetX 改造步骤2，继承GetController
class MinePageController extends GetxController {
  //GetX 改造步骤3 给变量添加 .obs
  var _backgroundUrl = Assets.image.defaultPhoto.path.obs;
  var _avatarUrl = Assets.image.avatar.path.obs;

  String get backgroundUrl => _backgroundUrl.value;

  set backgroundUrl(String url) => _backgroundUrl.value = url;

  String get likeCount => '23万';

  String get focusCount => '85225';

  String get followCount => '12567';

  var _name = 'wanghao'.obs;
  var _uid = '365'.obs;

  String get avatarUrl => _avatarUrl.value;

  set avatarUrl(String url) => _avatarUrl.value = url;

  String get name => _name.value;

  set name(String name) => _name.value = name;

  // String get uidDesc => _uid.value;
  String get uidDesc => '幕客:${_uid.value}';

  set uidDesc(String desc) => _uid.value = desc;

  Future<void> onTapBackground() async{
    var fileUrl = await router.push(name: MCRouter.photoPicker,arguments: {MCRouter.key_url: backgroundUrl});
    // 增加类型判断
    if (fileUrl is String) {
      backgroundUrl = fileUrl;
    }

  }
  Future<void> onTapAvatar() async {
    var fileUrl = await router.push(
        name: MCRouter.photoPicker, arguments: {MCRouter.key_url: avatarUrl});
    // 增加类型判断
    if (fileUrl is String) {
      avatarUrl = fileUrl;
    }
  }
}
