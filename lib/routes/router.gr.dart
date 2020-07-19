// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../presentation/pages/image_show_page.dart';
import '../presentation/pages/image_upload_page.dart';

class Routes {
  static const String imageShowPage = '/';
  static const String imageUploadPage = '/image-upload-page';
  static const all = <String>{
    imageShowPage,
    imageUploadPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.imageShowPage, page: ImageShowPage),
    RouteDef(Routes.imageUploadPage, page: ImageUploadPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ImageShowPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ImageShowPage(),
        settings: data,
      );
    },
    ImageUploadPage: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ImageUploadPage(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        transitionDuration: const Duration(milliseconds: 150),
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushImageShowPage() => push<dynamic>(Routes.imageShowPage);

  Future<dynamic> pushImageUploadPage() =>
      push<dynamic>(Routes.imageUploadPage);
}
