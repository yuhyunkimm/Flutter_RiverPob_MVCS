import 'package:flutter_riverpod_blog_start/dto/respose_dto.dart';
import 'package:flutter_riverpod_blog_start/model/post/post.dart';
import 'package:flutter_riverpod_blog_start/model/post/post_repository.dart';

void main() async {

}

Future<void> fetchPostList_test() async{
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJjb3PthqDtgbAiLCJpZCI6MSwiZXhwIjoxNjgyNjQ4NDE3fQ.HXUpnaEEeKeh4iJev0ZLch_A3ibLWyg9x4QE1YqKPs6PEX0jm2ZRIDcC8_XDGlwtOy0klNEWXC53cB1wCM05LQ";
  ResponseDTO responseDTO = await PostRepository().fetchPostList(jwt);
  print(responseDTO.code);
  print(responseDTO.msg);
  List<Post> postList = responseDTO.data;
  postList.forEach((element) {
    print(element.title);
  });
}

