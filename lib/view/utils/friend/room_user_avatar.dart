import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class RoomUserAvatar extends ConsumerWidget {
  const RoomUserAvatar({
    Key? key,
    required this.user,
  }) : super(key: key);
  final FireUser user;
  @override
  Widget build(BuildContext context, ref) {
    final _model = ref.read(homeModelProvider);

    final _isURL = _model.urlChecker(user.iconURL);
    return Column(
      children: [
        if (_isURL)
          CircleAvatar(
            backgroundImage: NetworkImage(user.iconURL!),
          )
        else
          const CircleAvatar(
            child: Icon(Icons.account_circle),
          ),
        // Text(user.name),
      ],
    );
  }
}
