import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_module/widget/t_image.dart';

import '../gen/assets.gen.dart';

class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  static const image_height = 138.5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: image_height,
            child: TImage(Assets.image.defaultPhoto.path))
      ],
    );
  }
}
