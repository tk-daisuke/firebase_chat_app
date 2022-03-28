import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/message/message.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/room_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentRoomSnapshot = Provider.autoDispose<QueryDocumentSnapshot<Room>>(
    (ref) => throw UnimplementedError());

final roomModelProvider = ChangeNotifierProvider((ref) => RoomModel(ref.read));

final chatMessageValue = StateProvider.autoDispose<String>((ref) => '');

class RoomModel extends ChangeNotifier {
  // ignore: unused_field
  final Reader _read;
  RoomModel(this._read);

  String? get currentUserUID => FirebaseAuthService(_read).firebaseUID;

  Stream<QuerySnapshot<Message>> fetchCurrentRoomStream(String id) {
    final stream = RoomRepository().currentRoomMessages(id).snapshots();
    return stream;
  }

  // ignore: long-parameter-list
  Future<void> pushMessage(
    BuildContext context, {
    required String docID,
    required TextEditingController chatFormController,
    required StateController<String> chatMessageState,
  }) async {
    // Loading
    final progress = ProgressHUD.of(context);
    progress?.show();
    // 送信中
    final send = await _sendMessage(docID, chatMessageState.state);
    // ロード終了
    progress?.dismiss();
    // 成功
    if (send) {
      chatFormController.clear();
      chatMessageState.state = '';
    } 
    //失敗
    else {
      const snackBar = SnackBar(
        content: Text('通信エラーが発生しました。'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<bool> _sendMessage(String roomID, String text) async {
    final uid = currentUserUID;
    try {
      // 送信
      await RoomRepository()
          .sendMessage(roomID: roomID, myUID: uid!, text: text);
          // 成功
      return true;
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // 失敗
      return false;
    }
  }
}
