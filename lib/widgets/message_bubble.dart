import 'package:chatgpt_client/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.content,
    required this.isUserMessage,
    Key? key,
  }) : super(key: key);

  final String content;
  final bool isUserMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: AppStyle.black),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isUserMessage ? Icons.person : Icons.blur_on_sharp,
              color: isUserMessage ? AppStyle.white : AppStyle.primary2,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: MarkdownWidget(
                data: content,
                shrinkWrap: true,
                config: MarkdownConfig(
                  configs: [
                    isUserMessage
                        ? const PConfig(
                            textStyle: TextStyle(color: AppStyle.white))
                        : const PConfig(
                            textStyle: TextStyle(color: AppStyle.primary2)),
                    const H1Config(style: TextStyle(color: AppStyle.primary2))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
