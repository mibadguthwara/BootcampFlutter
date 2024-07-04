import 'dart:async';
import 'package:flutter/material.dart';
import 'model/comment_model.dart';
import 'services/materi_services.dart';

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({super.key, this.id});

  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPage();
}

class _DetailReadDataPage extends State<DetailReadDataPage> {
  late Future<Comment> futureComment = MateriServices.fetchcomment(widget.id);

  @override
  void initState() {
    super.initState();
    futureComment = futureComment;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fetch Data Comment",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Detail List"),
        ),
        body: Center(
          child: FutureBuilder<Comment>(
            future: futureComment,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final detailPosts = snapshot.data!;
                return buildDetail(detailPosts);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget buildDetail(Comment detailPosts) {
    return SafeArea(
      child: Container(
        color: Colors.grey.shade300,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        height: 350,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Id",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              "${detailPosts.id}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            const Text(
              "Username",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              detailPosts.name,
              style: const TextStyle(fontSize: 14),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            const Text(
              "Email",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(
              detailPosts.email,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            const Text(
              "Comment",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            Text(detailPosts.body),
          ],
        ),
      ),
    );
  }
}
