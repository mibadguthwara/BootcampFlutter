import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplayWidget extends StatelessWidget {
  const DateDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan tanggal dan waktu saat ini
    DateTime now = DateTime.now();

    // Format tanggal ke string menggunakan intl package
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(now);

    return Text(
      formattedDate,
      // textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
