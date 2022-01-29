import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/view/utils/friend/room_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class RoomInfoTile extends ConsumerWidget {
  const RoomInfoTile({
    required this.query,
    required this.roomName,
    this.ontap,
    Key? key,
  }) : super(key: key);
  final Query<FireUser> query;
  final String roomName;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context, ref) {
    return InkWell(
      onTap: ontap,
      child: FirestoreQueryBuilder<FireUser>(
          query: query,
          builder: (context, snapshot, child) {
            if (snapshot.isFetching) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            }
            final user = snapshot.docs[0].data();
            // final _model = ref.read(homeModelProvider);
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: RoomUserAvatar(
                    user: user,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
