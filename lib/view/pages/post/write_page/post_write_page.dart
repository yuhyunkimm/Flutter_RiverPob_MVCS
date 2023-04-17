
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_blog_start/core/utils/validator_util.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_elevated_button.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_text_form_field.dart';
import 'package:flutter_riverpod_blog_start/view/components/custom_textarea.dart';

class PostWritePage extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  PostWritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            CustomTextFormField(
              controller: _title,
              hint: "Title",
              funValidator: validateTitle(),
            ),
            CustomTextArea(
              controller: _content,
              hint: "Content",
              funValidator: validateContent(),
            ),
            CustomElevatedButton(
              text: "글쓰기",
              funPageRoute: () async {
                if (_formKey.currentState!.validate()) {

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
