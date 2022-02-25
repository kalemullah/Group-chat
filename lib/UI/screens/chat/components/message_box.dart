import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  const MessageBox({
    required this.sender,
    required this.text,
    this.isMe = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              sender,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 5),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            elevation: 5,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}