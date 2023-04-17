import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../components/custom_navigation.dart';

class PostHomePage extends ConsumerWidget {
  PostHomePage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    Logger().d("Consumer _buildBody 실행");
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {

          },
          child: ListTile(
            leading: Text("1"),
            title: Text("제목1"),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
