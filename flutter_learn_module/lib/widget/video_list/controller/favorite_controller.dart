import 'package:flutter_learn_module/widget/video_list/controller/video_controller.dart';
import 'package:flutter_learn_module/widget/video_list/server_data.dart';

class FavoriteController extends VideoController{
  @override
  // TODO: implement spKey
  String get spKey => 'favorite_video';

  @override
  // TODO: implement videoData
  String get videoData => ServerData.fetchFavoriteFromServer();

}