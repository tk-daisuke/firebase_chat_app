import 'package:firebase_template_app/view/ui/flutter_fire/fire_profile_screen.dart';
import 'package:firebase_template_app/view/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomIndex = StateProvider<int>((ref) => 0);
final navigatorProvider = ChangeNotifierProvider((ref) => NavigatorModel());

class NavigatorModel extends ChangeNotifier {
  final pageWidgets = [
    const HomeScreen(),
    const FireProfileScreen(),
  ];
}
