import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
                crossAxisCount: 3),
            itemCount: widget.controller.dataList?.length,
            itemBuilder: (context, index) {
              //实际项目中，通过DataList[index]获取url
              // var url =
              //     'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';
              return GestureDetector(
                  child: widget.controller.dataList == null
                      ? Container()
                      : AbsorbPointer(
                          absorbing: true,
                          child: VideoView(Player()
                            ..setCommonDataSource(
                              widget.controller.dataList![index].url ,
                              type: SourceType.asset,
                              autoPlay: true,
                            )),
                        ),
                  onTap: () async => await router.push(
                      name: MCRouter.playerPage,
                      arguments: widget.controller.dataList![index].url));
            }));
  }
}
