import 'package:agri_guardian/generated/assets.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AgriAiScreen extends StatefulWidget {
  const AgriAiScreen({super.key});

  @override
  State<AgriAiScreen> createState() => _AgriAiScreenState();
}

class _AgriAiScreenState extends State<AgriAiScreen> {
  final Gemini gemini = Gemini.instance;
  ChatUser currentUser = ChatUser(
    id: '0',
    firstName: "User",
  );
  ChatUser geminiUser =
      ChatUser(id: '1', firstName: "Agri Ai", profileImage: Assets.splash_logo);
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agri Ai'),
        centerTitle: true,
        actions: [
          Image.asset(
            Assets.splash_logo,
            height: 5.h,
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: _messageUI(),
    );
  }

  Widget _messageUI() {
    return DashChat(
        currentUser: currentUser, onSend: sendMessage, messages: messages);
  }

  void sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String? response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String? response = event.content?.parts?.fold(
                  "", (previous, current) => "$previous ${current.text}") ??
              "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
