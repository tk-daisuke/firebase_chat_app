import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:firebase_template_app/view/ui/home/widget/room_user_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoomInfoTile extends StatelessWidget {
  const RoomInfoTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: RoomUserAvatar(),
        ),
        Expanded(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer(builder: (context, ref, child) {
                final room = ref.read(currentRoom);

                return Text(room.name);
              }),
            ],
          ),
        ),
      ],
    );
  }
}
