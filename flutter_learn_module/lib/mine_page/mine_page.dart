import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_module/main.dart';
import 'package:flutter_learn_module/mc_router.dart';
import 'package:flutter_learn_module/widget/t_image.dart';

import '../gen/assets.gen.dart';

class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MinePageState();
}

String backgroundUrl = Assets.image.defaultPhoto.path;

class _MinePageState extends State<MinePage> {
  static const image_height = 138.5;

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
                child: TImage(backgroundUrl, fit: BoxFit.cover),
                onTap: () async {
                  var fileUrl = await router.push(
                      name: MCRouter.photoPicker,
                      arguments: {MCRouter.key_url: backgroundUrl});
                  if (fileUrl is String) {
                    backgroundUrl = fileUrl;
                    setState(() {});
                  }

                }))
      ],
    );
  }
}
