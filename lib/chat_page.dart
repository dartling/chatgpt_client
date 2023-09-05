import 'package:chatgpt_client/api/chat_api.dart';
import 'package:chatgpt_client/models/chat_message.dart';
import 'package:chatgpt_client/styles/styles.dart';
import 'package:chatgpt_client/widgets/message_bubble.dart';
import 'package:chatgpt_client/widgets/message_composer.dart';
import 'package:chatgpt_client/widgets/saved_folders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.chatApi,
    super.key,
  });

  final ChatApi chatApi;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messages = <ChatMessage>[
    ChatMessage('Hello, how can I help?', false),
  ];
  var _awaitingResponse = false;

  @override
  Widget build(BuildContext context) {
    final screenH = MediaQuery.of(context).size.height;
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppStyle.black,
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          SizedBox(
            width: screenW * 0.2,
            child: Container(
              decoration: const BoxDecoration(
                  color: AppStyle.black,
                  border: Border(right: BorderSide(color: AppStyle.white))),
              child: const SaveFolders(
                title: "Saved Folders",
                children: [Text("data")],
              ),
            ),
          ),
          SizedBox(
            width: screenW * 0.8,
            child: Stack(
              children: [
                SizedBox(
                  height: screenH * 0.9,
                  child: ListView(
                    children: [
                      ..._messages.map(
                        (msg) => MessageBubble(
                          content: msg.content,
                          isUserMessage: msg.isUserMessage,
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: screenW * 0.8,
                    height: screenH * 0.1,
                    child: MessageComposer(
                      onSubmitted: _onSubmitted,
                      awaitingResponse: _awaitingResponse,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubmitted(String message) async {
    setState(() {
      _messages.add(ChatMessage(message, true));
      _awaitingResponse = true;
    });

    try {
      // Save message to Firestore
      final chatRef = FirebaseFirestore.instance
          .collection('users')
          .doc('Jy9BeTo0OjEkPwKKZsHL')
          .collection('chats');
      final newMessage = {
        'content': message,
        'isUserMessage': true,
        'timestamp': FieldValue.serverTimestamp(),
      };
      await chatRef.add(newMessage);

      // Continue with chatApi logic
      final response = await widget.chatApi.completeChat(_messages);
      setState(() {
        _messages.add(ChatMessage(response, false));
        _awaitingResponse = false;
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Network error occurred. Please try again. $err'),
          backgroundColor: Colors.red,
        ),
      );
      setState(() {
        _awaitingResponse = false;
      });
    }
  }
}
