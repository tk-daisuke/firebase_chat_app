import 'package:firebase_template_app/view/ui/firend_add/firend_add_screen.dart';
import 'package:firebase_template_app/view/utils/friend/room_list.dart';
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
            onPressed: () =>
                Navigator.of(context).pushNamed(FriendAddScreen.id),
            icon: const Icon(Icons.add),
            label: const Text('フレンド登録'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoomList(),
            ),
          ],
        ),
      ),
    );
  }
}
