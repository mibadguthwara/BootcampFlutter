import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: InkWell(
          onTap: () {},
          child: ListTile(
            leading: Image.network(
              "https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg",
              height: 30,
              width: 30,
            ),
            title: const Text("Adam"),
            subtitle: const Text("Online"),
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            ],
          )
        ],
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Isi Chat"),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SearchBar(
                leading: Icon(Icons.emoji_emotions),
                hintText: "Type a message",
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.mic)),
          ],
        ),
      ),
    );
  }
}
