
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/core/constants/move.dart';
import 'package:flutter_riverpod_blog_start/dto/auth_request.dart';
import 'package:flutter_riverpod_blog_start/dto/respose_dto.dart';
import 'package:flutter_riverpod_blog_start/main.dart';
import 'package:flutter_riverpod_blog_start/model/auth/auth_repository.dart';
import 'package:flutter_riverpod_blog_start/provider/session_provider.dart';


final userControllerProvider =  Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController {
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  UserController(this.ref);


  Future<void> join(String username, String password, String email) async{
    JoinReqDTO joinReqDTO = JoinReqDTO(username: username, password: password, email: email);
    ResponseDTO responseDTO = await ref.read(authRepositoryProvider).fetchJoin(joinReqDTO);
    if(responseDTO.code == 1){
      Navigator.pushNamed(mContext!, Move.loginPage);
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("회원가입 실패")));
    }
  }

  Future<void> login(String username, String password) async{
    LoginReqDTO loginReqDTO = LoginReqDTO(username: username, password: password);
    ResponseDTO responseDTO = await ref.read(authRepositoryProvider).fetchLogin(loginReqDTO);
    if(responseDTO.code == 1){
      // 1. 토큰을 휴대폰에 저장
      await secureStorage.write(key: "jwt", value: responseDTO.tocken);

      // 2. 로그인 상태 등록
      ref.read(sessionProvider).loginSuccess(responseDTO.data, responseDTO.data);

      // 3. 화면 이동
      Navigator.popAndPushNamed(mContext!, Move.postHomePage);
    }else{
      ScaffoldMessenger.of(mContext!).showSnackBar(SnackBar(content: Text("회원가입 실패")));
    }
  }
  }
