import 'package:flutter/material.dart';

import 'chat_detail_screen.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = '/contact_screen';
  ContactScreen({super.key});

  final List<dynamic> listContact = [
    {
      "id": 1,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Boris",
      "status": "last seen recently"
    },
    {
      "id": 2,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Ferdinant",
      "status": "last seen recently"
    },
    {
      "id": 3,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Artur Grimes",
      "status": "last seen recently"
    },
    {
      "id": 4,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Maldives",
      "status": "last seen within a week"
    },
    {
      "id": 5,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Albert Spencer",
      "status": "last seen within a week"
    },
    {
      "id": 6,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Bernadette McLaughlin",
      "status": "last seen within a week"
    },
    {
      "id": 7,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Rudolph Boehm",
      "status": "last seen within a month"
    },
    {
      "id": 8,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Marc Gotze",
      "status": "last seen within a month"
    },
    {
      "id": 9,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Grizmenn",
      "status": "last seen a long time ago"
    },
    {
      "id": 10,
      "image": Image.asset(
        "assets/images/photo_profile.jpg",
        height: 80,
      ),
      "name": "Romeo Lukaku",
      "status": "last seen a long time ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        title: const Text("Contacts"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person_add_alt_outlined)),
        ],
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.group),
            title: Text("New Group"),
          ),
          const ListTile(
            leading: Icon(Icons.lock),
            title: Text("New Secret Chat"),
          ),
          const ListTile(
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("New Channel"),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: const Text(
              "Sorted by least seen time",
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.separated(
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
                      leading: const Icon(Icons.image),
                      title: Text(listContact[index]["name"]),
                      subtitle: Text(listContact[index]["status"]),
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
                itemCount: listContact.length),
          ),
        ],
      ),
    );
  }
}
