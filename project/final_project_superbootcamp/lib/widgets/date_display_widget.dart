import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateDisplayWidget extends StatelessWidget {
  const DateDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');

    String formattedDate = formatter.format(now);

    return Text(
      formattedDate,
      style: const TextStyle(
        fontSize: 16,
      ),
    );
  }
}
