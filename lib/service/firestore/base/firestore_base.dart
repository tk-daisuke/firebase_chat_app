import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FirebaseFirestoreBase {
  final firestore = FirebaseFirestore.instance;
  final serverTimeStamp = FieldValue.serverTimestamp();
}
