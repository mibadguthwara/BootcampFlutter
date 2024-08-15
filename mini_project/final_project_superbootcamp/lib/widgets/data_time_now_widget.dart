import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataTimeNowWidget extends StatefulWidget {
  const DataTimeNowWidget({super.key});

  @override
  State<DataTimeNowWidget> createState() => _DataTimeNowWidgetState();
}

class _DataTimeNowWidgetState extends State<DataTimeNowWidget> {
  @override
  Widget build(BuildContext context) {
    // Mengambil tanggal dan waktu saat ini
    DateTime now = DateTime.now();

    // Format tanggal dan waktu sesuai dengan format Indonesia
    String formattedDate = DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(now);
    String formattedTime = DateFormat('HH:mm:ss', 'id_ID').format(now);

    return Text(
      '$formattedDate | $formattedTime',
      style: const TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    );
  }
}
