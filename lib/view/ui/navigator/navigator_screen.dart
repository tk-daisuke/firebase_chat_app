import 'package:firebase_template_app/view/ui/navigator/navigator_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigatorScreen extends ConsumerWidget {
  const NavigatorScreen({Key? key}) : super(key: key);
  static const String id = 'NavigatorScreen';
  @override
  Widget build(BuildContext context, ref) {
    final _index = ref.watch(bottomIndex.state);
    final _model = ref.read(navigatorProvider);
    return Scaffold(
      // appBar: _appBar(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box_outlined,
            ),
            activeIcon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
        currentIndex: _index.state,
        onTap: (selectIndex) async {
          _index.state = selectIndex;
        },
      ),
      // _buttomNavigator(_index, context),

      body: _model.pageWidgets.elementAt(_index.state),
    );
  }
}
