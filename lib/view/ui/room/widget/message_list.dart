import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/view/ui/room/room_model.dart';
import 'package:firebase_template_app/view/utils/chat_bubble.dart';
import 'package:firebase_template_app/view/utils/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageList extends ConsumerWidget {
  const MessageList({
    Key? key,
    required this.docID,
  }) : super(key: key);

  final String docID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _model = ref.read(roomModelProvider);

    return StreamBuilder<QuerySnapshot<Message>>(
      stream: _model.fetchCurrentRoomStream(docID),
      builder: ((context, snapshot) {
        // ロード中
        // ignore: prefer-conditional-expressions
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        // エラー発生
        else if (snapshot.hasError) {
          return ErrorMessage(
              errorText: snapshot.error.toString(), reloadMethod: () {});
        }
        // ロード終了、エラーなし
        else {
          // 取得した中にデータはあったか
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) {
                    final currentUserID = _model.currentUserUID;
                    final doc = snapshot.data?.docs[index];
                    final isCurrentUser =
                        doc?.data().postUserID == currentUserID;
                    return ChatBubble(
                        isCurrentUser: isCurrentUser, message: doc!.data());
                  }),
                  shrinkWrap: true)
              :
              // データなし
              const Text('no data');
        }
      }),
    );
  }
}
