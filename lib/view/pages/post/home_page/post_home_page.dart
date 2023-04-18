import 'package:flutter/material.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_navigation.dart';
import 'package:flutter_riverpod_blog_start/view/pages/post/home_page/components/post_home_body.dart';
import 'package:logger/logger.dart';

class PostHomePage extends StatelessWidget {
  PostHomePage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  // 페이지 새로고침
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    Logger().d("homePage 빌드");

    return Scaffold(
      key: scaffoldKey,
      drawer: CustomNavigation(scaffoldKey),
      appBar: AppBar(
          title: Text(""),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {

        },
        child: PostHomeBody(),
      ),
    );
  }
}
