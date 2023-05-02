import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/gen/assets.gen.dart';
import 'package:flutter_learn_module/widget/t_image.dart';
import 'package:player/player.dart';
import 'package:player/video_view.dart';

import '../../../main.dart';
import '../../../mc_router.dart';
import '../controller/video_controller.dart';

class VideoList extends StatefulWidget {
  final VideoController controller;

  VideoList(this.controller);

  @override
  State<StatefulWidget> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  // VideoController _controller = VideoController();
  // late VideoController _controller;
  @override
  void initState() {
    super.initState();
    // controller =
    //     VideoController(); //这种初始化方式，如果在_VideoListState被复用场景 一个_VideoListState对应一个 VideoController
    widget.controller.init().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.75),
            itemCount: widget.controller.dataList?.length,
            itemBuilder: (context, index) {
              //实际项目中，通过DataList[index]获取url
              // var url =
              //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';
              return GestureDetector(
                  child: widget.controller.dataList == null
                      ? Container() // 加载提示或骨架屏
                      : Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xfffef5ff), width: 0)),
                          child: Stack(
                            children: [
                              AbsorbPointer(
                                absorbing: true,
                                child: VideoView(
                                  Player()
                                    ..setLoop(0)
                                    ..setCommonDataSource(
                                      widget.controller.dataList![index].url,
                                      type: SourceType.net,
                                      autoPlay: true,
                                    ),
                                  fit: FijkFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                    left: 15,
                                  ),
                                  child: Row(
                                    children: [
                                      TImage(
                                        Assets.image.play.path,
                                        height: 12,
                                      ),
                                      Text(
                                        widget.controller.count.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                  onTap: () async => await router.push(
                      name: MCRouter.playerPage,
                      arguments: widget.controller.dataList![index].url));
            }));
  }
}
