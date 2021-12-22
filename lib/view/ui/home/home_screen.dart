import 'package:firebase_template_app/view/utils/flutter_fire_ui.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(FlutterFireProfileScreen.id);
                },
                child: const Text('a'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
