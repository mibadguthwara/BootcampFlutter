import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDisplayWidget extends StatefulWidget {
  const TimeDisplayWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TimeDisplayWidgetState createState() => _TimeDisplayWidgetState();
}

class _TimeDisplayWidgetState extends State<TimeDisplayWidget> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime(); // Update waktu saat ini saat inisialisasi
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _updateTime(); // Perbarui waktu setiap detik
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Hentikan timer saat widget dibuang
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      // Mendapatkan waktu saat ini dan format ke string
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _currentTime,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
