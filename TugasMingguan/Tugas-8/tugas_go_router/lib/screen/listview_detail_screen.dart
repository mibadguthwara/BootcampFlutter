import 'package:flutter/material.dart';
import '/services/model/user_model.dart';

class ListViewDetailScreen extends StatelessWidget {
  final UserModel user;
  const ListViewDetailScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Detail ListView dari data Api"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              children: [
                Image.network(user.avatar!, height: 150),
                Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text(
                      '${user.firstName} ${user.lastName}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      user.email!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
