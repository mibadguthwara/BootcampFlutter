import 'dart:async';
import 'package:flutter/material.dart';
import 'model/album_model.dart';
import 'services/materi_services.dart';

class DetailReadDataPage extends StatefulWidget {
  const DetailReadDataPage({super.key, this.id});

  // ignore: prefer_typing_uninitialized_variables
  final id;

  @override
  State<DetailReadDataPage> createState() => _DetailReadDataPage();
}

class _DetailReadDataPage extends State<DetailReadDataPage> {
  late Future<Album> futureAlbum = MateriServices.fetchAlbum(widget.id);

  @override
  void initState() {
    super.initState();
    futureAlbum = futureAlbum;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fetch Data Example",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
