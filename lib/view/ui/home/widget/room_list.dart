import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:firebase_template_app/view/ui/home/widget/room_info_tile.dart';
import 'package:flutter/foundation.dart';
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
                  final room = snapshot.docs[index].data();
                  if (kDebugMode) {
                    print(room);
                  }
                  return ProviderScope(
                    overrides: [currentRoom.overrideWithValue(room)],
                    child: const RoomInfoTile(),
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
