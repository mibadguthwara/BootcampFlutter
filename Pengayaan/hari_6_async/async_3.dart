import 'dart:async';

class MessageStream {
  final _controller = StreamController<String>();

  void sendMessage(String message) {
    _controller.sink.add(message);
  }

  Stream<String> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}

class MessagePrinter {
  final MessageStream messageStream;

  MessagePrinter(this.messageStream) {
    messageStream.stream.listen((message) {
      print('Pesan diterima: $message');
    });
  }
}

void main() {
  final messageStream = MessageStream();
  final messagePrinter = MessagePrinter(messageStream);
  print(messagePrinter);

  messageStream.sendMessage('Selamat Datang');
  messageStream.sendMessage('Sehat Selalu');
  messageStream.sendMessage('Silahkan Masuk');

  Future.delayed(Duration(seconds: 3), () {
    messageStream.dispose();
  });
}
