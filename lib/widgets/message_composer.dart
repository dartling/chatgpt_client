import 'package:chatgpt_client/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MessageComposer extends StatelessWidget {
  MessageComposer({
    required this.onSubmitted,
    required this.awaitingResponse,
    super.key,
  });

  final TextEditingController _messageController = TextEditingController();

  final void Function(String) onSubmitted;
  final bool awaitingResponse;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: AppStyle.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                maxLines: 5,
                minLines: 1,
                controller: _messageController,
                onSubmitted: onSubmitted,
                decoration: const InputDecoration(
                  hintText: 'Write your message here...',
                  border: InputBorder.none,
                ),
              ),
            ),
            !awaitingResponse
                ? Material(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: AppStyle.primary3,
                    child: IconButton(
                      onPressed: () => onSubmitted(_messageController.text),
                      icon: const Icon(
                        Icons.send,
                        color: AppStyle.white,
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SpinKitThreeBounce(
                      size: 25,
                      color: AppStyle.primary4,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
