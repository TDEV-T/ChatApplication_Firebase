import "package:flutter/material.dart";

class ChatBubble extends StatelessWidget {
  final String msg;
  final bool current;
  const ChatBubble({super.key, required this.msg, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          color: current ? Colors.green : Colors.grey.shade500,
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
