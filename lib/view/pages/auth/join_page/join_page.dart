import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';
import 'package:logger/logger.dart';

class JoinPage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController(); // 추가
  final _password = TextEditingController(); // 추가
  final _email = TextEditingController();

  JoinPage({super.key}); // 추가

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Logger().d("joinpage 그려짐");
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            height: 200,
            child: const Text(
              "회원가입 페이지",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _joinForm(), // 추가
        ],
      ),
    );
  }

  Widget _joinForm() {
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

              }
            },
          ),
          TextButton(
            onPressed: () {

            },
            child: const Text("로그인 페이지로 이동"),
          ),
        ],
      ),
    );
  }
}
