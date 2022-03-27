
import 'package:firebase_template_app/model/message/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.isCurrentUser,
    required this.message,
  }) : super(key: key);

  final bool isCurrentUser;
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isCurrentUser ? Colors.green : Colors.black45,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            message.text,
            style:
                TextStyle(color: isCurrentUser ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}