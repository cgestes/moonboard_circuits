// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'pages/add_circuit_page.dart' as _i2;
import 'pages/circuits_page.dart' as _i1;
import 'pages/view_circuit_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    CircuitsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.CircuitsPage());
    },
    AddCircuitRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<AddCircuitRouteArgs>(
          orElse: () => AddCircuitRouteArgs(
              boardVersion: pathParams.getString('boardVersion')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.AddCircuitPage(
              boardVersion: args.boardVersion, key: args.key));
    },
    ViewCircuitsRoute.name: (routeData) {
      final pathParams = routeData.pathParams;
      final args = routeData.argsAs<ViewCircuitsRouteArgs>(
          orElse: () => ViewCircuitsRouteArgs(
              boardVersion: pathParams.getString('boardVersion'),
              uid: pathParams.getString('uid')));
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.ViewCircuitsPage(
              boardVersion: args.boardVersion, uid: args.uid, key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(CircuitsRoute.name, path: '/'),
        _i4.RouteConfig(AddCircuitRoute.name, path: '/:boardVersion/add'),
        _i4.RouteConfig(ViewCircuitsRoute.name, path: '/:boardVersion/:uid')
      ];
}

/// generated route for [_i1.CircuitsPage]
class CircuitsRoute extends _i4.PageRouteInfo<void> {
  const CircuitsRoute() : super(name, path: '/');

  static const String name = 'CircuitsRoute';
}

/// generated route for [_i2.AddCircuitPage]
class AddCircuitRoute extends _i4.PageRouteInfo<AddCircuitRouteArgs> {
  AddCircuitRoute({required String boardVersion, _i5.Key? key})
      : super(name,
            path: '/:boardVersion/add',
            args: AddCircuitRouteArgs(boardVersion: boardVersion, key: key),
            rawPathParams: {'boardVersion': boardVersion});

  static const String name = 'AddCircuitRoute';
}

class AddCircuitRouteArgs {
  const AddCircuitRouteArgs({required this.boardVersion, this.key});

  final String boardVersion;

  final _i5.Key? key;
}

/// generated route for [_i3.ViewCircuitsPage]
class ViewCircuitsRoute extends _i4.PageRouteInfo<ViewCircuitsRouteArgs> {
  ViewCircuitsRoute(
      {required String boardVersion, required String uid, _i5.Key? key})
      : super(name,
            path: '/:boardVersion/:uid',
            args: ViewCircuitsRouteArgs(
                boardVersion: boardVersion, uid: uid, key: key),
            rawPathParams: {'boardVersion': boardVersion, 'uid': uid});

  static const String name = 'ViewCircuitsRoute';
}

class ViewCircuitsRouteArgs {
  const ViewCircuitsRouteArgs(
      {required this.boardVersion, required this.uid, this.key});

  final String boardVersion;

  final String uid;

  final _i5.Key? key;
}
