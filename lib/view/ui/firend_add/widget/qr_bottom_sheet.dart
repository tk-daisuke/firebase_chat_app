import 'package:firebase_template_app/view/ui/firend_add/firend_add_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrBottomSheet extends StatelessWidget {
  const QrBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size.height;
    final scrollController = ScrollController();
    return Container(
      height: _size / 2,
      padding: const EdgeInsets.all(8),
      child: ListView(
        controller: scrollController,
        shrinkWrap: true,
        children: <Widget>[
          const _QrImageBuilder(),
          // Consumer(builder: (context, ref, child) {
          // final _model = ref.read(friendAddModelProvider.notifier);
          //   return ElevatedButton(
          //     style:
          //         ElevatedButton.styleFrom(maximumSize: const Size(200, 100)),
          //     onPressed: () async {},
          //     child: const Text('QR code scan'),
          //   );
          // }),
          ElevatedButton(
            child: const Text('Close BottomSheet'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

class _QrImageBuilder extends ConsumerWidget {
  const _QrImageBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _model = ref.watch(friendAddModelProvider.notifier);
    final _uid = _model.currentUserUID;
    final _nullCheck = _uid != null;
    final _size = MediaQuery.of(context).size.height;

    return _nullCheck
        ? Column(
            children: [
              const Text(
                'my friend code',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              QrImage(
                data: _uid,
                version: QrVersions.auto,
                size: _size / 3,
              ),
            ],
          )
        : Column(
            children: [
              const Text('error'),
              TextButton(
                onPressed: () => ref.refresh(friendAddModelProvider.notifier),
                child: const Text('refresh'),
              ),
            ],
          );
  }
}
