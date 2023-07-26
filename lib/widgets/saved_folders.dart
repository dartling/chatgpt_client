import 'package:chatgpt_client/styles/styles.dart';
import 'package:flutter/material.dart';

class SaveFolders extends StatefulWidget {
  const SaveFolders({super.key, required this.title, required this.children});

  final String title;
  final List<Widget> children;
  @override
  State<SaveFolders> createState() => _SaveFoldersState();
}

class _SaveFoldersState extends State<SaveFolders> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppStyle.white),
          ),
          trailing: Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppStyle.white),
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          subtitle: isExpanded ? Column(children: widget.children) : null,
        ),
      ],
    );
  }
}
