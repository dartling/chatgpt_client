import 'package:chatgpt_client/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.content,
    required this.isUserMessage,
    super.key,
  });

  final String content;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Container(
      //  width: screenW,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.black,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            isUserMessage
                ? const Icon(
                    Icons.person_4,
                    color: AppStyle.white,
                  )
                : const Icon(
                    Icons.blur_on_sharp,
                    color: AppStyle.primary2,
                  ),
            // Text(
            //   isUserMessage ? 'You' : 'AI',
            //   style: TextStyle(
            //       fontFamily: 'PPNeueMachina-PlainRegular',
            //       fontSize: 18,
            //       color: isUserMessage ? AppStyle.white : AppStyle.primary2),
            // ),
            const SizedBox(width: 8),

            MarkdownWidget(
              data: content,
              shrinkWrap: true,
              config: MarkdownConfig(
                configs: const [
                  PConfig(textStyle: TextStyle(color: AppStyle.primary2)),
                  H1Config(style: TextStyle(color: AppStyle.primary2))
                ],
              ),
            ),

            // Text(
            //   content,
            //   style: TextStyle(
            //       fontFamily: 'PPNeueMachina',
            //       fontSize: 18,
            //       color: isUserMessage ? AppStyle.white : AppStyle.primary2),
            // ),
          ],
        ),
      ),
    );
  }
}
