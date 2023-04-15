import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_module/widget/Timage.dart';

import 'gen/assets.gen.dart';

class MinePage extends StatefulWidget {
  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [TImage(Assets.image.defaultPhoto.path)],
    );
  }
}
