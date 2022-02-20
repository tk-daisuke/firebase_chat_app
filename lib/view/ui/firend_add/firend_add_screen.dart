import 'package:firebase_template_app/model/fire_user/fire_user.dart';
import 'package:firebase_template_app/view/ui/firend_add/firend_add_model.dart';
import 'package:firebase_template_app/view/ui/firend_add/widget/qr_bottom_sheet.dart';
import 'package:firebase_template_app/view/utils/friend/room_info_tile.dart';
import 'package:firebase_template_app/view/widget/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class FriendAddScreen extends StatelessWidget {
  const FriendAddScreen({Key? key}) : super(key: key);
  static const String id = 'firend_add_screen';
  @override
  Widget build(BuildContext context) {
    // final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendAdd'),
        actions: const [
          _MyQrCode(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    _UidTextField(),
                    _SearchResult(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyQrCode extends StatelessWidget {
  const _MyQrCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _model = ref.read(friendAddModelProvider.notifier);
      return ElevatedButton.icon(
        onPressed: () {
          _model.displaysBottomSheet(const QrBottomSheet(), context);
        },
        label: const Text('MyCode'),
        icon: const Icon(Icons.qr_code),
      );
    });
  }
}

class _UidTextField extends StatelessWidget {
  const _UidTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final _model = ref.watch(friendAddModelProvider.notifier);
        // final _state = ref.watch(friendAddModelProvider);

        return Column(
          children: [
            TextField(
              // controller: TextEditingController(text: _state.friendUID),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffix: IconButton(
                  onPressed: () {
                    if (_model.mounted) {
                      _model.friendQrScan();
                    }
                  },
                  icon: const Icon(Icons.qr_code),
                ),
                border: const OutlineInputBorder(), // 外枠付き
                labelText: "firend uid",
                hintText: 'Enter firend uid',
              ),
              onChanged: (String value) {
                _model.changeTextField(value);
              },
            ),
            // Text(_state.friendUID)
          ],
        );
      },
    );
  }
}

class _SearchResult extends StatelessWidget {
  const _SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _state = ref.watch(friendAddModelProvider);
      final _model = ref.watch(friendAddModelProvider.notifier);
      return FirestoreQueryBuilder<FireUser>(
        query: _model.fetchfirend(_state.friendUID),
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return ErrorMessage(
              errorText: snapshot.error.toString(),
              reloadMethod: () => ref.refresh(friendAddModelProvider),
            );
          }
          return snapshot.docs.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    final _friend = snapshot.docs[index].data();

                    return RoomInfoTile(
                        ontap: () async {
                          final addFriend = await _model.addFriend(_friend.uid);
                          _model.addFriendResult(addFriend, context);
                        },
                        query: _model.fetchfirend(_friend.uid),
                        roomName: _friend.name);
                  })
              : const _FriendEmpty();
        },
      );
    });
  }
}

class _FriendEmpty extends ConsumerWidget {
  const _FriendEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _search = ref.read(friendAddModelProvider).friendUID;
    final _isEdit = _search.isNotEmpty;
    return _isEdit
        ? Column(
            children: [
              // TODO(*):Test
              const Text('friendが見つかりません'),
              TextButton(
                onPressed: () => ref.refresh(friendAddModelProvider),
                child: const Text('再読み込み'),
              ),
            ],
          )
        : const SizedBox();
  }
}
