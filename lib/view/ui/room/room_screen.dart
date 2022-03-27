import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/room/room_model.dart';
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
                    MessageList(model: _model, docID: docID),
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

class MessageList extends StatelessWidget {
  const MessageList({
    Key? key,
    required RoomModel model,
    required this.docID,
  })  : _model = model,
        super(key: key);

  final RoomModel _model;
  final String docID;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Message>>(
      stream: _model.fetchCurrentRoomStream(docID),
      builder: ((context, snapshot) {
        // ignore: prefer-conditional-expressions
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          // ignore: prefer-conditional-expressions
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  final currentUserID = _model.currentUserUID;
                  final doc = snapshot.data?.docs[index];
                  final isCurrentUser = doc!.data().postUserID == currentUserID;
                  return ChatBubble(
                    isCurrentUser: isCurrentUser,
                    message: doc.data(),
                  );
                }),
                shrinkWrap: true);
          } else {
            return const Text('no data');
          }
        }
      }),
    );
  }
}

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.isCurrentUser,
    required this.message,
  }) : super(key: key);

  final bool isCurrentUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isCurrentUser ? Colors.green : Colors.black45,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            message.text,
            style:
                TextStyle(color: isCurrentUser ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
