
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/controller/user_controller.dart';
import 'package:flutter_riverpod_blog_start/core/constants/move.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';

class JoinForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController(); // 추가
  final _password = TextEditingController(); // 추가
  final _email = TextEditingController();
  JoinForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username, // 추가
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password, // 추가
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomTextFormField(
            controller: _email, // 추가
            hint: "Email",
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
            text: "회원가입",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                // join async 함수 = 비동기 함수
                // 만약 밑에서 함수를 만들어야 한다면 async 와 await를 꼭!!!
                ref.read(userControllerProvider).join(
                    // 공백이 들어갈 수 있기 때문에 꼭 trim을 넣어 줘야한다
                    _username.text.trim(),
                    _password.text.trim(),
                    _email.text.trim()
                );
              }
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, Move.loginPage);
            },
            child: const Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
