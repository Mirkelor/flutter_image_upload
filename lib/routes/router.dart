import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter_image_upload/presentation/pages/image_show_page.dart';
import 'package:flutter_image_upload/presentation/pages/image_upload_page.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: ImageShowPage, initial: true),
  CustomRoute(
      page: ImageUploadPage,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 150),
], generateNavigationHelperExtension: true)
class $Router {}
