import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/model/room/room.dart';
import 'package:firebase_template_app/view/ui/home/home_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('フレンド登録'),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Consumer(builder: (context, ref, child) {
                final _model = ref.read(homeModelProvider);
                return FirestoreQueryBuilder<Room>(
                  query: _model.roomQuery(),
                  builder: (context, snapshot, child) {
                    if (snapshot.isFetching) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return _ErrorWidget(errorText: snapshot.error.toString());
                    }

                    return snapshot.docs.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.docs.length,
                            itemBuilder: (context, index) {
                              final room = snapshot.docs[index].data();
                              if (kDebugMode) {
                                print(room);
                              }
                              final _uid = _model.currentUserUID;
                              return Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: RoomUserAvatar(
                                      // TODO 条件反転予定
                                      uid: room.entrant
                                          .where((element) => element == _uid)
                                          .first,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(room.name),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            })
                        : const Text('Roomがありません');
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class RoomUserAvatar extends StatelessWidget {
  const RoomUserAvatar({
    Key? key,
    required this.uid,
  }) : super(key: key);
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _model = ref.read(homeModelProvider);
      return FirestoreQueryBuilder<FireUser>(
        query: _model.userQuery(uid),
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          }
          final user = snapshot.docs[0].data();
          return Column(
            children: [
              if (user.iconURL != null && user.iconURL!.isNotEmpty)
                CircleAvatar(
                  backgroundImage: NetworkImage(user.iconURL!),
                )
              else
                const FlutterLogo(
                  size: 300,
                  textColor: Colors.blue,
                  style: FlutterLogoStyle.stacked,
                ),
              Text(user.name),
            ],
          );
        },
      );
    });
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key, required this.errorText}) : super(key: key);
  final String errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          errorText.toString(),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('再読み込み'),
        ),
      ],
    );
  }
}
