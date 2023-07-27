import 'package:chatgpt_client/api/chat_api.dart';
import 'package:chatgpt_client/chat_page.dart';
import 'package:chatgpt_client/firebase_options.dart';
import 'package:chatgpt_client/styles/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp(chatApi: ChatApi()));
}

class ChatApp extends StatelessWidget {
  const ChatApp({required this.chatApi, super.key});

  final ChatApi chatApi;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGPT Client',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppStyle.primary4,
        ),
        fontFamily: 'PPNeueMachina', //  primaryColor: AppStyle.primary2,
      ),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: AppStyle.primary3,
      //     secondary: AppStyle.primary2,
      //   ),
      // ),
      home: ChatPage(chatApi: chatApi),
    );
  }
}


//  child: Padding(
        // padding: const EdgeInsets.all(12),
        // child: Row(
        //   children: [
        //     isUserMessage
        //         ? const Icon(
        //             Icons.person_4,
        //             color: AppStyle.white,
        //           )
        //         : const Icon(
        //             Icons.blur_on_sharp,
        //             color: AppStyle.primary2,
        //           ),
        //     // Text(
        //     //   isUserMessage ? 'You' : 'AI',
        //     //   style: TextStyle(
        //     //       fontFamily: 'PPNeueMachina-PlainRegular',
        //     //       fontSize: 18,
        //     //       color: isUserMessage ? AppStyle.white : AppStyle.primary2),
        //     // ),
        //     const SizedBox(width: 8),
        //     Text(
        //       content,
        //       style: TextStyle(
        //           fontFamily: 'PPNeueMachina-PlainRegular',
        //           fontSize: 18,
        //           color: isUserMessage ? AppStyle.white : AppStyle.primary2),
        //     ),
        //   ],
        // ),
    