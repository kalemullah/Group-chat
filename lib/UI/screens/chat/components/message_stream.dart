//import 'package:chat_app/screens/chat/components/message_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'message_box.dart';

class MessageStream extends StatefulWidget {
  final String email;
  const MessageStream(this.email, {Key? key}) : super(key: key);

  @override
  State<MessageStream> createState() => _MessageStreamState();
}

class _MessageStreamState extends State<MessageStream> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('dateTime').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final messages = snapshot.data!.docs.reversed;

        List<MessageBox> messageBoxes = [];
        for (var message in messages) {
          final msg = message.data() as Map<String, dynamic>;
          final sender = msg['sender'];
          final text = msg['text'];

          final messageBox = MessageBox(
            sender: sender,
            text: text,
            isMe: widget.email == sender,
          );
          messageBoxes.add(messageBox);
        }
        return ListView(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: messageBoxes,
        );
      },
    );
  }
}