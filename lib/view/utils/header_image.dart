import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  const HeaderImage(
    this.image, {
    Key? key,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.network(image),
      ),
    );
  }
}
