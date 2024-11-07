import 'dart:convert';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../theme/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final String ourUri =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=AIzaSyC4t-_GkGdB3my0vfn0wxaiOhbzbfKinOE';

  final Map<String, String> header = {
    'Content-Type': 'application/json',
  };

  // User type message
  final ChatUser mySelf = ChatUser(
    id: "1",
    firstName: "my Self",
  );

  // Bot type message
  final ChatUser bot = ChatUser(
    id: "2",
    firstName: "Flat finder",
  );

  List<ChatMessage> messages = [];
  List<ChatUser> _typing = [];

  Future<void> getData(ChatMessage m) async {
    _typing.add(bot);
    messages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    try {
      final response = await http.post(
        Uri.parse(ourUri),
        headers: header,
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        print("Response: $result");

        if (result != null && result.containsKey('candidates')) {
          String botResponseText =
          result['candidates'][0]['content']['parts'][0]['text'];

          ChatMessage botMessage = ChatMessage(
            text: botResponseText,
            user: bot,
            createdAt: DateTime.now(),
          );
          messages.insert(0, botMessage);
          setState(() {});
        } else {
          print("Unexpected response structure: $result");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      _typing.remove(bot);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: AppColors().green,
            statusBarIconBrightness: Brightness.light));
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.only(bottom: 28.0),
        child: DashChat(
          typingUsers: _typing,
          currentUser: mySelf,
          onSend: (ChatMessage m) {
            getData(m);
          },
          messages: messages,
          inputOptions: const InputOptions(
            alwaysShowSend: true,
            autocorrect: true,
            inputTextStyle: TextStyle(fontSize: 20),
            cursorStyle: CursorStyle(color: Colors.redAccent),
          ),
          messageOptions: MessageOptions(
            currentUserContainerColor: Colors.blue,
            showTime: true,
            avatarBuilder: (user, onAvatarTap, onAvatarLongPress) => Center(
              child: Image.asset(
                "assets/images/logo.png",
                height: 40,
                width: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

