import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? isDarkMode
                ? (Colors.blue.shade600)
                : Colors.blue.shade500
            : isDarkMode
                ? (Colors.grey.shade800)
                : Colors.grey.shade200,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft:
                isCurrentUser ? Radius.circular(12) : Radius.circular(0),
            bottomRight:
                isCurrentUser ? Radius.circular(0) : Radius.circular(12)),
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
            color: isCurrentUser
                ? Colors.white
                : isDarkMode
                    ? Colors.white
                    : Colors.black),
      ),
    );
  }
}
