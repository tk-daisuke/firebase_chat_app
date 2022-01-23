import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    final usersQuery = FirebaseFirestore.instance.collection('users');
final chat = FirebaseFirestore.instance.collection('');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FirestoreListView<Map<String, dynamic>>(
                shrinkWrap: true,
                query: usersQuery,
                itemBuilder: (context, snapshot) {
                  Map<String, dynamic> user = snapshot.data();

                  return Text('User name is ${user['name']}');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
