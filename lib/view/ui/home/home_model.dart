import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/service/auth/firebase_auth_service.dart';
import 'package:firebase_template_app/service/firestore/firestore_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeModelProvider = ChangeNotifierProvider((ref) => HomeModel(ref.read));

class HomeModel extends ChangeNotifier {
  // ignore: unused_field
  final Reader _read;
  HomeModel(this._read);

  String? get currentUserUID => FirebaseAuthService(_read).firebaseUID;

  Query<FireUser> userQuery(String uid) {
    final query = FirestoreService(_read).fetchProfile(uid);
    return query.withConverter<FireUser>(
      fromFirestore: (snapshot, _) => FireUser.fromJson(snapshot.data()!),
      toFirestore: (user, _) =>
          FireUser(uid: user.uid, iconURL: user.iconURL, name: user.name)
              .toJson(),
    );
  }

  Query<Room> roomQuery() {
    final query = FirestoreService(_read).fetchRoom();
    return query.withConverter<Room>(
      fromFirestore: (snapshot, _) => Room.fromJson(snapshot.data()!),
      toFirestore: (room, _) => room.copyWith().toJson(),
    );
  }
}
