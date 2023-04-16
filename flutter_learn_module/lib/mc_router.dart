import 'package:flutter/cupertino.dart';

class MCRouter extends RouterDelegate<List<RouteSettings>>with ChangeNotifier,PopNavigatorRouterDelegateMixin {
  static const String minePage ='/mine';
  static const String photoPicker = '/photo_picker';
  static const String playerPage = '/player';

  static const String key ='key';
  static const String value ='value';
  static const String url ='url';
  static const String key_height ='height';
  static const String key_width = 'width';

  final List<Page> _page =[];
  late Comparable<Object?> _boolResultCompleter;


  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
  return Navigator(key: navigatorKey,pages: _page,onPopPage: _onPopPage)
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }

  @override
  // TODO: implement navigatorKey
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();
}
