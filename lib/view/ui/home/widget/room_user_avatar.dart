import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class RoomUserAvatar extends StatelessWidget {
  const RoomUserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _model = ref.read(homeModelProvider);
      final room = ref.read(currentRoom);
      return FirestoreQueryBuilder<FireUser>(
        query: _model.fetchFriendQuery(room),
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }
          final user = snapshot.docs[0].data();
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
              Text(user.name),
            ],
          );
        },
      );
    });
  }
}
