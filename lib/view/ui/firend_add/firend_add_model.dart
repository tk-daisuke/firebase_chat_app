import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/firestore_service.dart';
import 'package:firebase_template_app/view/ui/firend_add/friend_add_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendAddModelProvider =
    StateNotifierProvider.autoDispose<FriendAddModel, FriendAddState>(
        (ref) => FriendAddModel(ref.read));

final currentFriendProvider =
    Provider<FireUser>((ref) => throw UnimplementedError());

class FriendAddModel extends StateNotifier<FriendAddState> {
  FriendAddModel(this._read) : super(const FriendAddState());

  // ignore: unused_field
  final Reader _read;

  late final _firestore = FirestoreService(_read);
  late final _auth = FirebaseAuthService(_read);
  String? get currentUserUID => FirebaseAuthService(_read).firebaseUID;

  Query<FireUser> fetchfirend(String friendUID) {
    final _uid = _auth.firebaseUID;
    if (friendUID != _uid) {
      final _friend = _firestore.userProfileQuery(friendUID);
      return _friend;
    } else {
      return _firestore.userProfileQuery('');
    }
  }

  Future<bool> addFriend(String friendUID) async {
    final _uid = _auth.firebaseUID;
    final _uidCheck = friendUID != _uid && _uid != null;
    if (_uidCheck) {
      try {
        final _addFriend =
            await _firestore.addFriend(friendUID: friendUID, myUID: _uid);
        return _addFriend;
      } on Exception catch (e) {
        if (kDebugMode) {
          print(e);
        }
        return false;
      }
    } else {
      return false;
    }
  }

  void addFriendResult(bool success, BuildContext context) {
    final SnackBar snackBar;
    snackBar = success
        ? const SnackBar(content: Text('フレンド登録しました'))
        : const SnackBar(content: Text('フレンド登録済みです'));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void friendDialog(BuildContext context) {
    // final _dialog = DialogService().updateDialog(context, dialog: dialog);
  }

  String changeTextField(String text) {
    state = state.copyWith(friendUID: text);
    return state.friendUID;
  }

  Future<String> friendQrScan() async {
    final scan = await FlutterBarcodeScanner.scanBarcode(
        "ff6666", "キャンセル", false, ScanMode.DEFAULT);
    changeTextField(scan);
    return scan;
  }

  void displaysBottomSheet(
    Widget child,
    BuildContext context,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => child,
      context: context,
    );
    // Scaffold.of(context).
    // showBottomSheet((context) => child, elevation: 0.5);
  }
}
