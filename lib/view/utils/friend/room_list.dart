import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:firebase_template_app/view/ui/room/room_screen.dart';
import 'package:firebase_template_app/view/utils/friend/room_info_tile.dart';
import 'package:firebase_template_app/view/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class RoomList extends ConsumerWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.watch(homeModelProvider);
    return FirestoreQueryBuilder<Room>(
      query: _model.roomQuery(),
      builder: (context, snapshot, child) {
        if (snapshot.isFetching) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return ErrorMessage(
            errorText: snapshot.error.toString(),
            reloadMethod: () => _model.refreshButton(),
          );
        }

        return snapshot.docs.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.docs.length,
                itemBuilder: (context, index) {
                  final item = snapshot.docs[index];

                  return RoomInfoTile(
                    query: _model.fetchFriendQuery(item.data()),
                    roomName: item.data().name,
                    ontap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RoomScreen(item)),
                      );
                    },
                  );
                })
            : Column(
                children: [
                  const Text('Roomがありません'),
                  TextButton(
                    onPressed: () => _model.refreshButton(),
                    child: const Text('再読み込み'),
                  ),
                ],
              );
      },
    );
  }
}
