import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/room/room_model.dart';
import 'package:firebase_template_app/view/ui/room/widget/message_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RoomScreen extends ConsumerWidget {
  const RoomScreen(this.snapshot, {Key? key}) : super(key: key);
  static const String id = 'room_screen';
  final QueryDocumentSnapshot<Room> snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProgressHUD(
      child: Builder(builder: (context) {
        return ProviderScope(
          overrides: [currentRoomSnapshot.overrideWithValue(snapshot)],
          child: Consumer(builder: (context, ref, _) {
            // ignore: unused_local_variable
            final _model = ref.read(roomModelProvider);
            final snapshot = ref.watch(currentRoomSnapshot);
            final room = snapshot.data();
            final docID = snapshot.id;
            return Scaffold(
              bottomNavigationBar: _ChatForm(docID: docID),
              appBar: AppBar(
                title: Text(room.name),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    MessageList(docID: docID),
                  ],
                ),
              ),
            );
          }),
        );
      }),
    );
  }
}

class _ChatForm extends ConsumerWidget {
  const _ChatForm({
    Key? key,
    required this.docID,
  }) : super(key: key);

  final String docID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final chatMessageController = TextEditingController();
    final _model = ref.read(roomModelProvider);
    final _messageValue = ref.watch(chatMessageValue.notifier);

    return SizedBox(
      height: 100,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // ChatForm
            Expanded(
              child: TextField(
                controller: chatMessageController,
                maxLength: 40,
                maxLines: 1,
                onChanged: (text) {
                  if (_messageValue.mounted) {
                    _messageValue.state = text;
                  }
                },
              ),
            ),
            // sendボタン
            ElevatedButton(
                onPressed: () async {
                  await _model.pushMessage(context,
                      docID: docID,
                      chatFormController: chatMessageController,
                      chatMessageState: _messageValue);
                },
                child: const Text('push'))
          ],
        ),
      )),
    );
  }
}
