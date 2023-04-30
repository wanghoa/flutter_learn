import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_module/main.dart';
import 'package:flutter_learn_module/mc_router.dart';
import 'package:flutter_learn_module/mine_page/mine_page_controller.dart';
import 'package:flutter_learn_module/widget/t_image.dart';
import 'package:get/get.dart';


class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MinePageState();
}



class _MinePageState extends State<MinePage> {
  static const image_height = 138.5;
  // final _controller = MinePageController();// 这么创建也可以，如果其他页面需要使用controller 需要将它传递过去，所以使用 getX
  final _controller = Get.put(MinePageController());
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: image_height,
            child: GestureDetector(
                child: TImage(_controller.backgroundUrl.value, fit: BoxFit.cover),
                onTap: () async {
                  var fileUrl = await router.push(
                      name: MCRouter.photoPicker,
                      arguments: {MCRouter.key_url: _controller.backgroundUrl.value});
                  if (fileUrl is String) {
                    _controller.backgroundUrl.value = fileUrl;
                    // setState(() {});使用 GetX 不需要setState
                  }

                }))
      ],
    );
  }
}
