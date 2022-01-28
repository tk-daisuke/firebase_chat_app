import 'package:firebase_template_app/view/ui/firend_add/firend_add_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class FriendAddScreen extends StatelessWidget {
  const FriendAddScreen({Key? key}) : super(key: key);
  static const String id = 'firend_add_screen';
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendAdd'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Consumer(builder: (context, ref, child) {
                        final _model =
                            ref.watch(friendAddModelProvider.notifier);
                        return TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(), // 外枠付きデザイン

                            labelText: "firend uid",
                            hintText: 'Enter firend uid',
                          ),
                          onChanged: (value) async {
                            _model.changeTextField(value);
                            await Future.delayed(const Duration(seconds: 1));
                            if (_model.mounted) {
                              ref.refresh(friendAddModelProvider);
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        );
                      }),
                      Consumer(builder: (context, ref, child) {
                        final _state = ref.watch(friendAddModelProvider);
                        final _model =
                            ref.watch(friendAddModelProvider.notifier);
                        return FirestoreQueryBuilder(
                          query: _model.fetchfirend(_state.friendUID),
                          builder: (BuildContext context,
                              FirestoreQueryBuilderSnapshot<dynamic> snapshot,
                              Widget? child) {
                            return Text('data');
                          },
                        );
                      }),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
