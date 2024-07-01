import 'package:flutter/material.dart';
import 'package:sanber_app_flutter/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<dynamic> listChat = [
    {
      "id": 1,
      "image": const Icon(Icons.image),
      "name": "adam",
      "chat": "lorem ipsum dolor sit amet",
      "day": "09:35",
    },
    {
      "id": 2,
      "image": const Icon(Icons.image),
      "name": "Lex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 3,
      "image": const Icon(Icons.image),
      "name": "Alex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 4,
      "image": const Icon(Icons.image),
      "name": "Marco",
      "chat": "lorem ipsum dolor sit amet",
      "day": "12/05/2022",
    },
    {
      "id": 5,
      "image": const Icon(Icons.image),
      "name": "adam",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 6,
      "image": const Icon(Icons.image),
      "name": "Lex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 7,
      "image": const Icon(Icons.image),
      "name": "Alex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 8,
      "image": const Icon(Icons.image),
      "name": "Marco",
      "chat": "lorem ipsum dolor sit amet",
      "day": "12/05/2022",
    },
    {
      "id": 9,
      "image": const Icon(Icons.image),
      "name": "adam",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 10,
      "image": const Icon(Icons.image),
      "name": "Lex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "01/05/2024",
    },
    {
      "id": 11,
      "image": const Icon(Icons.image),
      "name": "Alex",
      "chat": "lorem ipsum dolor sit amet",
      "day": "Yesterday",
    },
    {
      "id": 12,
      "image": const Icon(Icons.image),
      "name": "Marco",
      "chat": "lorem ipsum dolor sit amet",
      "day": "12/05/2022",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: listChat.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailScreen();
              }));
            },
            child: ListTile(
              leading: const Icon(Icons.image),
              title: Text(listChat[index]["name"]),
              subtitle: Text(listChat[index]["chat"]),
              trailing: Text(listChat[index]["day"]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 3, color: Colors.black, indent: 50.0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }
}
