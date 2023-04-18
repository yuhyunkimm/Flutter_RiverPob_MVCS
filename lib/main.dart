import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_blog_start/core/constants/move.dart';

import 'package:flutter_riverpod_blog_start/model/user/user_repository.dart';

import 'provider/session_provider.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() async {
  // MyApp 시작전에 필요한 것 여기서 다 로딩(동기적 실행)
  // 전에 비동기 되는 것이 있으면 완료하고 진행해라
  WidgetsFlutterBinding.ensureInitialized();
  // 1. 시큐어 스토리지에 JWT 있는지 확인
  // 2. JWT를 가지고 회원정보를 가져와서
  // 3. SessionUser 동기화(ref에 접근해야함)

  // 디코딩에서 날짜시간 체크해서 강제 로그인 시켜서

  SessionUser sessionUser = await UserRepository().fetchJwtVerify();

  // 아래 코드도 가능하다 왜냐면 앱을 본인만 사용하기 때문에
  // String? jwt = await secureStorage.read(key: "jwt");
  // if(jwt == null) {
  //   SessionUser.logoutSuccess();
  // } else {
  //   SessionUser.logoutSuccess(null, jwt);
  // }

  runApp(
     ProviderScope(
      overrides: [
        sessionProvider.overrideWithValue(sessionUser)
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: sessionUser.isLogin! ? Move.postHomePage : Move.loginPage,
      routes: getRouters(),
    );
  }
}
