import 'package:flutter/material.dart';
import 'package:hivechat/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  const ChatBubble(
      {super.key, required this.isCurrentUser, required this.message});

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for correct bubble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser
            ? (isDarkMode ? Colors.green.shade600 : Colors.green.shade500)
            : (isDarkMode ? Colors.grey.shade900 : Colors.grey.shade500),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(
          color: isDarkMode
              ? Colors.white
              : (isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}