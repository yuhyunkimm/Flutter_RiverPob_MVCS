
import 'package:dio/dio.dart';
import 'package:flutter_riverpod_blog_start/dto/respose_dto.dart';
import 'package:flutter_riverpod_blog_start/model/user/user.dart';
import 'package:flutter_riverpod_blog_start/model/auth/auth_repository.dart';

final dio = Dio(BaseOptions(
    baseUrl: "http://192.168.200.176:8080",
    contentType: "application/json; charset=utf-8",
));

void main() async {
  await fetchJoin_test();
}

Future<void> fetchLogin_test() async {
  // given
  String username = "ssar";
  String password = "1234";

  // when
  Map<String, dynamic> requestBody = {
    "username":username,
    "password":password
  };

  // 1. 통신 시작
  Response response = await dio.post("/login", data: requestBody);

  // 2. DTO 파싱
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = User.fromJson(responseDTO.data);

  // 3. 토큰 받기
  responseDTO.tocken = response.headers["authorization"].toString();

  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.tocken);
  User user = responseDTO.data;
  print(user.id);
  print(user.username);
}



Future<void> fetchJoin_test() async {
  // given
  String username = "ssar4";
  String password = "1234";
  String email = "ssar4@nate.com";

  // when

  Map<String, dynamic> requestBody = {
    "username":username,
    "password":password,
    "email":email
  };
  // 확실히 받을 데이터 (code msg data로 받아야한다)
  // user.toJson()
  // 요청 시에는 map을 body에 담기(dio가 json으로 변경해준다)
  // 응닫 시에는 Response.data에 map을 담아줌(dio가 json으로 변경해서 담아준다)
  Response response = await dio.post("/join", data: requestBody);
  ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  responseDTO.data = User.fromJson(responseDTO.data);
  print(responseDTO.code);
  print(responseDTO.msg);
  print(responseDTO.data);

  User user = responseDTO.data;
  print(user.id);
  print(user.username);
  print(user.email);



}
