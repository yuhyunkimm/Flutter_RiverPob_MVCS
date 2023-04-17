import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailPage extends ConsumerWidget {
  final int postId;
  const PostDetailPage(this.postId, {super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(),
      Row(
        children: [
          ElevatedButton(
            onPressed: () async {

            },
            child: const Text("삭제"),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {

            },
            child: const Text("수정"),
          ),
        ],
      ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(""),
            ),
          ),
        ],
      ),
    );
  }


}
