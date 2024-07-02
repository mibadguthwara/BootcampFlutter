import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: ClipOval(
            child: Image.asset(
              "assets/images/photo_profile.jpg",
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          // Icon(Icons.image),
          title: const Text(
            "Boris",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Online",
            style: TextStyle(color: Colors.blue[400]),
          ),
          onTap: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[100]),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                  ),
                  child: const Text(
                    "Looking forward to the trip",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[300]),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                  ),
                  child: const Text(
                    "Same! can't wait",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Today 8:43 PM",
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6KfYv0Xbur8nrBLdFvSLfTzZH9lRF5Vbfg&s",
                  height: 150,
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[100]),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                  ),
                  child: const Text(
                    "What do you think?",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[300]),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 15, vertical: 8)),
                  ),
                  child: const Text(
                    "Oh yes this looks great!",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.attach_file),
              ),
            ),
            Expanded(
              flex: 1,
              child: TextField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 4,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(14),
                  hintText: "Message",
                  suffixIcon: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.emoji_emotions),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mic),
                      ),
                    ],
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
