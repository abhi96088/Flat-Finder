
import 'dart:core';

import 'package:flat_finder/theme/colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  // List of images to be shown as dp of chats
  List<Image>images = [
    Image.asset("assets/images/model 4.jpg"),
    Image.asset("assets/images/model 5.jpg"),
    Image.asset("assets/images/model 2.jpeg"),
    Image.asset("assets/images/model 7.jpg"),
    Image.asset("assets/images/model1.jpeg"),
    Image.asset("assets/images/model 6.jpg"),
    Image.asset("assets/images/model 3.jpeg"),
    Image.asset("assets/images/model 9.jpg"),
    Image.asset("assets/images/model 8.jpg"),
  ];

  // List to be shown as name of chats
  List<String> names = [
    "Aarav",
    "Aditya",
    "Sanya",
    "Arjun",
    "Meera",
    "Ishaan",
    "Nisha",
    "Rohan",
    "Pooja",

  ];

  // List to be shown as message in chats
  List<String>messages = [
    "Hi, are we still on for today?",
    "Can you send me the details again?",
    "I'm running late, but I'll be there.",
    "Thanks for the update!",
    "Just checking in. How's it going?",
    "Let's reschedule for next week.",
    "Do you need help with that?",
    "I'm here. Where are you?",
    "Sorry, I missed your call. Can we talk later?"
  ];

  List<String>messageTiming = [
    "10:30 PM",
    "3:15 PM",
    "Yesterday",
    "Yesterday",
    "2d",
    "Sept 4",
    "Aug 29",
    "Aug 12",
    "July 27",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().green,
        title: Text("Messages", style: TextStyle(fontSize: 24, fontFamily: "Poppins-Semibold", color: AppColors().darkGreen),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.search_rounded, size: 30, color: AppColors().darkGreen,)
          ),
          IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.more_vert_rounded, size: 30,color: AppColors().darkGreen,)
          )
        ],
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: images[index].image,
              radius: 25,
            ),
            title: Text(names[index], style: const TextStyle(fontSize: 16, fontFamily: "Poppins-Semibold")),
            subtitle: Text(messages[index], style: const TextStyle(fontSize: 14, color: Colors.grey)),
            trailing: Text(messageTiming[index], style: const TextStyle(fontSize: 12, color: Colors.grey)),
          );
        },
      ),
    );
  }
}