import 'package:flutter/material.dart';
import 'package:slicing_telegram/chat_detail_screen.dart';
import 'package:slicing_telegram/contact_screen.dart';

class ChatScreen extends StatelessWidget {
  static const routeName = '/chat_screen';
  ChatScreen({super.key});

  final List<dynamic> listChat = [
    {
      "id": 1,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
      ),
      "name": "Boris",
      "chat": "Stikers",
      "date": "Now",
      "status": "1"
    },
    {
      "id": 2,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Artur Grimes",
      "chat": "This software is easy to open...",
      "date": "1:30 PM",
      "status": "2"
    },
    {
      "id": 3,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Maldives",
      "chat": "Dafid: I have been using sof...",
      "date": "2:17 PM",
      "status": "2"
    },
    {
      "id": 4,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Racing Club",
      "chat": "Mazda Lovers Sarah: I hav",
      "date": "4:30 PM",
      "status": "54"
    },
    {
      "id": 5,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Albert Spencer",
      "chat": "Stikers",
      "date": "Yesterday",
      "status": "4"
    },
    {
      "id": 1,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Bernadette McLaughlin",
      "chat": "voice message",
      "date": "29/06/2024",
      "status": "8"
    },
    {
      "id": 1,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Rudolph Boehm",
      "chat": "Say hi to Alice",
      "date": "25/06/2024",
      "status": "1"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Chats"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ContactScreen();
                  }),
                );
              },
              icon: const Icon(Icons.add_circle_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ChatDetailScreen();
                    },
                  ),
                );
              },
              child: ListTile(
                // leading: Image(image: listChat[index]["image"]),
                leading: const Icon(Icons.image),
                title: Text(listChat[index]["name"]),
                subtitle: Text(listChat[index]["chat"]),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(listChat[index]["date"]),
                    Text(listChat[index]["status"]),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 3,
              color: Colors.black,
              indent: 50.0,
            );
          },
          itemCount: listChat.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
