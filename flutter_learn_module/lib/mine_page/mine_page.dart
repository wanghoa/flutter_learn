import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/main.dart';
import 'package:flutter_learn_module/mc_router.dart';
import 'package:flutter_learn_module/mine_page/mine_page_controller.dart';
import 'package:flutter_learn_module/widget/t_image.dart';
import 'package:flutter_learn_module/widget/text_count.dart';
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
                child: TImage(_controller.backgroundUrl, fit: BoxFit.cover),
                onTap: () async {
                  var fileUrl = await router.push(
                      name: MCRouter.photoPicker,
                      arguments: {MCRouter.key_url: _controller.backgroundUrl});
                  if (fileUrl is String) {
                    _controller.backgroundUrl = fileUrl;
                    // setState(() {});使用 GetX 不需要setState
                  }
                })),
        Padding(
          padding: EdgeInsets.only(top: image_height - 4),
          child: _buildCard(),
        )
      ],
    );
  }

  Widget _buildCard() {
    // 纵向对齐 // SizeBox 通常用占位符
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 100),
            Expanded(child: TextCount('获赞', _controller.likeCount)),
            Container(width: 1, height: 33, color: Color(0xffe3e2e2)),
            Expanded(child: TextCount('关注', _controller.likeCount)),
            Container(width: 1, height: 33, color: Color(0xffe3e2e2)),
            Expanded(child: TextCount('粉丝', _controller.likeCount)),
            Container(width: 1, height: 33, color: Color(0xffe3e2e2)),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 19),
          child: Obx(() => Text(
                _controller.name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, left: 19),
          child: Obx(() => Text(
                _controller.uidDesc,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    decoration: TextDecoration.none),
              )),
        )
      ],
    );
  }
}
