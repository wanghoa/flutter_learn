import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_module/mine_page.dart';
import 'package:flutter_learn_module/widget/photo_picker.dart';

import 'gen/assets.gen.dart';
import 'player_page/player_page.dart';

class MCRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  static const String minePage = '/mine';
  static const String photoPicker = '/photo_picker';
  static const String playerPage = '/player';

  static const String key = 'key';
  static const String value = 'value';
  static const String key_url = 'url';
  static const String key_height = 'height';
  static const String key_width = 'width';

  final List<Page> _page = [];
  late Completer<Object?> _boolResultCompleter;

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(key: navigatorKey, pages: _page, onPopPage: _onPopPage);
  }

  @override
  Future<bool> popRoute({Object? params}) {
    if (params != null) {
      _boolResultCompleter.complete(params);
    }
    if(_canPop()) {
      _page.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
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
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    if (_canPop()) {
      _page.removeLast();
      return true;
    } else {
      return false;
    }
  }

  /// 判断 page栈 长度，为空即将退出app，不为空则返回true 表示页面关闭
  bool _canPop() {
    return _page.length > 1;
  }

  void replace({required String name, dynamic arguments}) {
    if (_page.isNotEmpty) {
      _page.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  Future<Object?> push({required String name, dynamic arguments}) async {
    _boolResultCompleter = Completer<Object?>();
    _page.add(_createPate(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
  }

  MaterialPage _createPate(RouteSettings routeSettings) {
    Widget page;
    var args = routeSettings.arguments;
    switch (routeSettings.name) {
      case minePage:
        page = MinePage();
        break;
      case photoPicker:
        String? url;
        String height = '';
        String width = '';
        if (args is Map<String, String>) {
          url = args[MCRouter.key_url];
          height = args[MCRouter.key_height] ?? height;
          width = args[MCRouter.key_width] ?? width;
        }
        page = PhotoPickerPage(url ?? Assets.image.defaultPhoto.keyName);
        break;
      case playerPage:
        page = PlayerPage(videoUrl: routeSettings.arguments?.toString() ?? '');
        break;
      default:
        page = const Scaffold();
    }
    return MaterialPage(
        child: page,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('确认退出吗'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('取消')),
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('确定'))
          ],
        );
      },
    );
    return result ?? true;
  }
}
