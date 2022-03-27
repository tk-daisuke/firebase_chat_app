import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/room_repository.dart';
import 'package:firebase_template_app/service/firestore/user_repository.dart';
import 'package:firebase_template_app/service/url_service.dart';
import 'package:firebase_template_app/service/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeModelProvider = ChangeNotifierProvider((ref) => HomeModel(ref.read));

// final currentUser = Provider<User>((watch) => throw UnimplementedError());

class HomeModel extends ChangeNotifier {
  // ignore: unused_field
  final Reader _read;
  HomeModel(this._read);

  String? get currentUserUID => FirebaseAuthService(_read).firebaseUID;

  void refreshButton() => notifyListeners();

  bool urlChecker(String? url) => UrlService().urlChecker(url);
  friendDilog(BuildContext context) => DialogService().updateDialog(context,
      dialog: const AlertDialog(
        title: Text(''),
      ));

  Query<FireUser> fetchFriendQuery(Room room) {
    final String _friendProfile = _searchFriendProfile(room);
    final query = UserRepository().userProfileQuery(_friendProfile);
    return query;
  }

  String _searchFriendProfile(Room room) {
    final _uid = currentUserUID;
    final String _friendProfile =
        room.entrant.where((element) => element != _uid).first;
    return _friendProfile;
  }

  Query<Room> roomQuery() {
    final uid = currentUserUID;
    return RoomRepository().joindRoomQuery(uid!);
  }
}
