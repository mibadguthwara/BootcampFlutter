import 'dart:async';
import 'package:flutter/material.dart';
import 'detail_read.dart';
import 'model/list_comment_model.dart';
import 'services/materi_services.dart';

Future<List<Post>> postsFuture = MateriServices.getPosts();

class ReadDataPage extends StatefulWidget {
  const ReadDataPage({super.key});

  @override
  State<ReadDataPage> createState() => _ReadDataPageState();
}

class _ReadDataPageState extends State<ReadDataPage> {
  late Future<Post> futureAlbum;

  @override
  void initState() {
    super.initState();
    postsFuture = postsFuture;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "List Comment",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Data Comment"),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: postsFuture,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final posts = snapshot.data!;
                return buildPost(posts);
              } else {
                return const Text("No data available");
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPost(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return InkWell(
          onTap: () {
            print(post.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailReadDataPage(id: post.id),
              ),
            );
          },
          child: Container(
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 130,
            width: double.maxFinite,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.network(
                      "https://sanbercode.com/assets/img/identity/logo@2x.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        post.name!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(post.email!),
                      const SizedBox(height: 5),
                      Text(
                        post.body!,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
