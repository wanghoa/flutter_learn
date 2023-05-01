import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/video_model.dart';
import '../server_data.dart';

abstract class VideoController {
  ///针对不同类型视频，采用不同的key存储
  String get spKey;

  /// 返回不同的视频内容
  String get videoData;

  List<VideoModel>? dataList; //第二种方案
  int get count => Random().nextInt(1000);

  Future<void> init() async {
    dataList ??= (await fetchVideoData3());
  }

  /**
   * 从服务端获取json字符串 类型表示的视频数据
   */

  // 增加缓存逻辑  第三种优化方案
  Future<List<VideoModel>> fetchVideoData3() async {
    var sp = await SharedPreferences.getInstance();
    var modelStr = sp.getString(spKey);
    if (modelStr != null && modelStr.isNotEmpty) {
      // 二级缓存中有数据直接使用 。（一级缓存是内存）
      var list = jsonDecode(modelStr) as List<dynamic>;
      return list.map((e) => VideoModel.fromJson(e)).toList();
    } else {
      //三级缓存
      var list = jsonDecode(videoData);
      var sp = await SharedPreferences.getInstance();
      sp.setString(spKey, videoData);

      return list.map((e) => VideoModel.fromJson(e)).toList();
    }
  }
}
