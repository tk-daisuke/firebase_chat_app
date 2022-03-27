import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/room/room_model.dart';
import 'package:firebase_template_app/view/ui/room/widget/message_list.dart';
import 'package:firebase_template_app/view/utils/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RoomScreen extends ConsumerWidget {
  const RoomScreen(this.snapshot, {Key? key}) : super(key: key);
  static const String id = 'room_screen';
  final QueryDocumentSnapshot<Room> snapshot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late final chatMessageController = TextEditingController();
    return ProgressHUD(
      child: Builder(builder: (context) {
        return ProviderScope(
          overrides: [currentRoomSnapshot.overrideWithValue(snapshot)],
          child: Consumer(builder: (context, ref, _) {
            final _model = ref.read(roomModelProvider);
            final snapshot = ref.watch(currentRoomSnapshot);
            final room = snapshot.data();
            final docID = snapshot.id;
            return Scaffold(
              bottomNavigationBar: SizedBox(
                height: 100,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer(builder: (context, ref, _) {
                    final _messageValue = ref.watch(chatMessageValue.notifier);
                    return Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: chatMessageController,
                          maxLength: 40,
                          onChanged: (text) {
                            if (_messageValue.mounted) {
                              _messageValue.state = text;
                            }
                          },
                        )),
                        ElevatedButton(
                            onPressed: () async {
                              await _model.pushMessage(context,
                                  docID: docID,
                                  chatMessageController: chatMessageController,
                                  chatMessageState: _messageValue);
                            },
                            child: const Text('push'))
                      ],
                    );
                  }),
                )),
              ),
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
