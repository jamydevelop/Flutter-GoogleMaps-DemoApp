// ignore_for_file: library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final List<ChatMessage> _messages = [
    const ChatMessage(
      text: "Hello! How can I help you today?",
      isSentByUser: false,
    ),
    const ChatMessage(
      text: "Hi, I'm having trouble with my account.",
      isSentByUser: true,
    ),
    const ChatMessage(
      text: "Sure, I'll do my best to assist you. What seems to be the problem?",
      isSentByUser: false,
    ),
    const ChatMessage(
      text: "I can't seem to log in. It keeps saying my password is incorrect.",
      isSentByUser: true,
    ),
    const ChatMessage(
      text: "Let me check that for you. Could you please provide me with your email address?",
      isSentByUser: false,
    ),
    const ChatMessage(
      text: "Sure, it's example@example.com.",
      isSentByUser: true,
    ),
    const ChatMessage(
      text: "Thank you. One moment please.",
      isSentByUser: false,
    ),
    const ChatMessage(
      text: "Sure, take your time.",
      isSentByUser: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return _messages[index];
      },
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByUser;

  const ChatMessage({Key? key, required this.text, required this.isSentByUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: isSentByUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isSentByUser ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            text,
            style: TextStyle(color: isSentByUser ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
