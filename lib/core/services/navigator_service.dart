import '../../core/base/base_service.dart';
import 'package:flutter/material.dart';

class NavigatorService extends BaseService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateWithPageReplacement(String routeName,
      {dynamic arguments}) {
    return navigatorKey.currentState
        .popAndPushNamed(routeName, arguments: arguments);
  }

  goBack({data}) {
    return navigatorKey.currentState.pop(data);
  }

  Future<dynamic> popAll(String routeName) {
    return navigatorKey.currentState
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }

  getNavigatorKey() {
    return navigatorKey.currentContext;
  }
  getContext(){
    return navigatorKey.currentState.context;
  }
}
