import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage(
      {Key? key, required this.errorText, required this.reloadMethod})
      : super(key: key);
  final String errorText;
  final VoidCallback reloadMethod;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            errorText.toString(),
          ),
          TextButton(
            onPressed: reloadMethod,
            child: const Text('再読み込み'),
          ),
        ],
      ),
    );
  }
}
