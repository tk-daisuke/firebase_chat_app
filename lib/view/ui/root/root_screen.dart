import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_template_app/service/att_service.dart';
import 'package:firebase_template_app/view/ui/root/root_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({Key? key}) : super(key: key);
  static const String id = 'root_screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ios のATTを確認
    final _att = ref.watch(attFutureProvider);

    return _att.when(
      loading: () => const _Loading(),
      error: (error, stack) => Text('Error: $error'),
      data: (
        TrackingStatus value,
      ) {
        // ログイン状態を確認
        final _model = ref.watch(rootProvider);

        _model.loginCheck(context);

        return const Scaffold(
          body: _Loading(),
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        semanticsLabel: 'Loading',
      ),
    );
  }
}
