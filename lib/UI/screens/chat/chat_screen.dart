// import 'package:chat_app/screens/chat/components/message_stream.dart';
// import 'package:chat_app/screens/inbox/components/logout_button.dart';
// import 'package:chat_app/widgets/my_text_field.dart';
import 'package:chatsapp/UI/custom_widget/text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'components/message_stream.dart';

class ChatScreen extends StatelessWidget {
  final String email;
  const ChatScreen(this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _messageController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
       // actions: const [LogoutButton()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(child: MessageStream(email)),
              Row(
                children: [
                  Expanded(
                    child: MyTextField(
                      hint: 'Type...',
                      controller: _messageController,
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () => _onTapSend(_messageController, email),
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapSend(TextEditingController controller, String sender) async{
   await FirebaseFirestore.instance.collection('messages').add({
      'sender': sender,
      'text': controller.text.trim(),
      'dateTime': DateTime.now(),
    });
    controller.clear();
  }
}