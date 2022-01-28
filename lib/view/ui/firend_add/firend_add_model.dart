import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/firestore_service.dart';
import 'package:firebase_template_app/view/ui/firend_add/friend_add_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final friendAddModelProvider =
    StateNotifierProvider.autoDispose<FriendAddModel, FriendAddState>(
        (ref) => FriendAddModel(ref.read));

class FriendAddModel extends StateNotifier<FriendAddState> {
  FriendAddModel(this._read) : super(const FriendAddState());

  // ignore: unused_field
  final Reader _read;

  late final _firestore = FirestoreService(_read);
  late final _auth = FirebaseAuthService(_read);

  Query<FireUser> fetchfirend(String friendUID) {
    final _uid = _auth.firebaseUID;
    if (friendUID != _uid) {
      final _friend = _firestore.fetchProfile(friendUID);
      print(_friend);
      return _friend;
    } else {
      return _firestore.fetchProfile('');
    }
  }

  void changeTextField(String text) {
    state.copyWith(friendUID: text);
  }
}
