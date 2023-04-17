
import 'package:flutter_riverpod_blog_start/model/user/user.dart';

// 최초 앱이 실행될 때 초기화 되어야 함
// 1. JWT 존재 유무 확인(I/O)
// 2. JWT로 회원정보를 받아봄(받아 지면 유효 안받아지면 무효)(I/O)
// 3. OK -> loginSuccess() 호출
// 4. FAIL -> loginPage로 이동
class SessionUser{
  // 아래 세가지가 defalt
  User? user;
  String? jwt;
  bool? isLogin;
  
  // 해당 토큰이 유효한지 확인
  // 토큰이 정상이야? 하는 정보가 필요하다
  void loginSuccess(User user, String jwt){
    this.user = user;
    this.jwt = jwt;
    this.isLogin = true;
  }

  // 앱저장소
  // 1. 하드디스크
  // 2. 앱마다 저장소 = sharedpreparence => 앱을 삭제하면 날아간다(있으면 계속있음)
  // => 앱이 켜질 때는 토큰을 확인하게 되는데 security storage에서 확인 함
  // => 최초 통신에서 wait에서 다 받고 넘어 가야한다
  // 3.
  void logoutSuccess(){
    this.user = null;
    this.jwt = null;
    this.isLogin = false;

  }
}