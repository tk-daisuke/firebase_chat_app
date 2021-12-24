
import 'package:flutter/material.dart';


Padding headerImage(String image) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: AspectRatio(
      aspectRatio: 1,
      child: Image.network(image),
    ),
  );
}
