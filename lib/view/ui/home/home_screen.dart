import 'package:firebase_template_app/view/ui/home/widget/room_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('フレンド登録'),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              RoomList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  const ErrorMessage(
      {Key? key, required this.errorText, required this.reloadMethod})
      : super(key: key);
  final String errorText;
  final VoidCallback reloadMethod;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          errorText.toString(),
        ),
        TextButton(
          onPressed: reloadMethod,
          child: const Text('再読み込み'),
        ),
      ],
    );
  }
}
