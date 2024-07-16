// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

// ignore: must_be_immutable
class SocketWebPage extends StatefulWidget {
  WebSocketChannel? channel;
  SocketWebPage({
    super.key,
    this.channel,
  });

  @override
  State<SocketWebPage> createState() => _SocketWebPageState();
}

class _SocketWebPageState extends State<SocketWebPage> {
  TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Socket page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                decoration:
                    const InputDecoration(labelText: "Send any message"),
                controller: editingController,
              ),
            ),
            StreamBuilder(
              stream: widget.channel?.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ""),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMyMessage,
        child: const Icon(Icons.send),
      ),
    );
  }

  void _sendMyMessage() {
    if (editingController.text.isNotEmpty) {
      widget.channel?.sink.add(editingController.text);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.channel?.sink.close();
  }
}
