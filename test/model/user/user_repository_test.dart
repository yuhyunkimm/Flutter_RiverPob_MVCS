
import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/core/constants/http.dart';
import 'package:flutter_riverpod_blog_start/dto/auth_request.dart';
import 'package:flutter_riverpod_blog_start/dto/respose_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user_repository.dart';

void main() async {
  await fetchLogin_test();
}

Future<void> fetchJoin_test() async{
  JoinReqDTO joinReqDTO = JoinReqDTO(username: "meta2", password: "1234", email: "meta@nate.com");
  ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
  print(responseDTO.code);
  print(responseDTO.msg);
}

Future<void> fetchLogin_test() async{
  LoginReqDTO loginReqDTO = LoginReqDTO(username: "ssar", password: "1234");
  ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.token);

}