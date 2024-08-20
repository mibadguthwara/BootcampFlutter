// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import 'package:intl/intl.dart';
import '/widgets/data_time_now_widget.dart';
import '../../models/item.dart';
import '../main_page.dart';

class OrderStatusPaymentPage extends StatefulWidget {
  final List<Item> receiveItems;
  final int totalQuantity;
  final int receiveTotalPrice;
  final String receiveNameCustomer;
  final String receivePaymentMethod;
  final int receivePaymnetTotal;
  final int receivePaymentChange;

  const OrderStatusPaymentPage({
    super.key,
    required this.receiveItems,
    required this.totalQuantity,
    required this.receiveTotalPrice,
    required this.receiveNameCustomer,
    required this.receivePaymentMethod,
    required this.receivePaymentChange,
    required this.receivePaymnetTotal,
  });

  @override
  State<OrderStatusPaymentPage> createState() => _OrderStatusPaymentPageState();
}

class _OrderStatusPaymentPageState extends State<OrderStatusPaymentPage> {
  // Buat instance NumberFormat dengan format mata uang IDR
  final currencyFormatter = NumberFormat.currency(
      locale: 'id_ID', name: 'IDR', decimalDigits: 0, symbol: 'Rp ');

  final TextEditingController nameCustomerOrder = TextEditingController();
  late String _displayCustomerName;
  late String _displayPaymentMethod;
  late String _formattedDate;
  late String _formattedTime;

  void _updateDateTime() {
    final now = DateTime.now();
    setState(() {
      _formattedDate = DateFormat('EEEE, dd-MM-yyyy', 'id_ID').format(now);
      _formattedTime = DateFormat('HH:mm:ss', 'id_ID').format(now);
    });
  }

  @override
  void initState() {
    super.initState();
    _displayCustomerName = widget.receiveNameCustomer;
    _displayPaymentMethod = widget.receivePaymentMethod;
    _updateDateTime();

    Timer.periodic(const Duration(seconds: 1), (Timer t) => _updateDateTime());
  }

  void _generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text("WANGISARI KUE",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.Text("Sariwangi, Parongpong, Bandung Barat",
                  style: const pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 10),
              pw.Text("$_formattedDate | $_formattedTime",
                  style: const pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Nama Pelanggan"),
                  pw.Text(_displayCustomerName,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jenis Pembayaran"),
                  pw.Text(_displayPaymentMethod,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(height: 3, color: PdfColors.black),
              ...widget.receiveItems.map(
                (item) {
                  final totalPriceForItem = item.price * item.quantity;
                  return pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(item.name,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 3),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "${currencyFormatter.format(item.price)} x ${item.quantity}"),
                            pw.Text(currencyFormatter.format(totalPriceForItem),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              pw.SizedBox(height: 16),
              pw.Divider(height: 3, color: PdfColors.black),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jumlah Makanan"),
                  pw.Text(widget.totalQuantity.toString(),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Total Pembayaran"),
                  pw.Text(currencyFormatter.format(widget.receiveTotalPrice),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jumlah yang dibayarkan"),
                  pw.Text(currencyFormatter.format(widget.receivePaymnetTotal),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Kembalian"),
                  pw.Text(currencyFormatter.format(widget.receivePaymentChange),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text("--- LUNAS ---",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 30),
              pw.Text("Terima kasih telah melakukan pembelian",
                  style: const pw.TextStyle(fontSize: 12)),
              pw.Text("Sampai ketemu kembali",
                  style: const pw.TextStyle(fontSize: 12),
                  textAlign: pw.TextAlign.center),
            ],
          ),
        ),
      ),
    );

    // await Printing.layoutPdf(
    //   onLayout: (PdfPageFormat format) async => pdf.save(),
    // );

    // Convert PDF to bytes
    final pdfBytes = await pdf.save();
    final base64Pdf = base64Encode(pdfBytes);

    // Save PDF data to Firestore
    await FirebaseFirestore.instance.collection('pdfs').add({
      'pdf_data': base64Pdf,
      'created_at': FieldValue.serverTimestamp(),
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('PDF berhasil disimpan ke Firestore!')),
    );
  }

  void _printPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              pw.Text("WANGISARI KUE",
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold)),
              pw.Text("Sariwangi, Parongpong, Bandung Barat",
                  style: const pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 10),
              pw.Text("$_formattedDate | $_formattedTime",
                  style: const pw.TextStyle(fontSize: 14)),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Nama Pelanggan"),
                  pw.Text(_displayCustomerName,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jenis Pembayaran"),
                  pw.Text(_displayPaymentMethod,
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Divider(height: 3, color: PdfColors.black),
              ...widget.receiveItems.map(
                (item) {
                  final totalPriceForItem = item.price * item.quantity;
                  return pw.Padding(
                    padding: const pw.EdgeInsets.symmetric(vertical: 10),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(item.name,
                            style: pw.TextStyle(
                                fontSize: 14, fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 3),
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                          children: [
                            pw.Text(
                                "${currencyFormatter.format(item.price)} x ${item.quantity}"),
                            pw.Text(currencyFormatter.format(totalPriceForItem),
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              pw.SizedBox(height: 16),
              pw.Divider(height: 3, color: PdfColors.black),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jumlah Makanan"),
                  pw.Text(widget.totalQuantity.toString(),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Total Pembayaran"),
                  pw.Text(currencyFormatter.format(widget.receiveTotalPrice),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Jumlah yang dibayarkan"),
                  pw.Text(currencyFormatter.format(widget.receivePaymnetTotal),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 10),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text("Kembalian"),
                  pw.Text(currencyFormatter.format(widget.receivePaymentChange),
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 20),
              pw.Text("--- LUNAS ---",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 30),
              pw.Text("Terima kasih telah melakukan pembelian",
                  style: const pw.TextStyle(fontSize: 12)),
              pw.Text("Sampai ketemu kembali",
                  style: const pw.TextStyle(fontSize: 12),
                  textAlign: pw.TextAlign.center),
            ],
          ),
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Status Pembayaran"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: _printPdf, icon: const Icon(Icons.print)),
          IconButton(
            onPressed: _generatePdf,
            icon: const Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MainPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "WANGISARI KUE",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Sariwangi, Parongpong, Bandung Barat",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: const DataTimeNowWidget(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Nama Pelanggan"),
                        Text(
                          _displayCustomerName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jenis Pembayaran"),
                        Text(
                          _displayPaymentMethod,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(height: 3, color: Colors.black),
                    ...widget.receiveItems.map(
                      (item) {
                        final totalPriceForItem = item.price * item.quantity;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 3),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                          currencyFormatter.format(item.price)),
                                      const SizedBox(width: 15),
                                      const Text("x"),
                                      const SizedBox(width: 15),
                                      Text("${item.quantity}"),
                                    ],
                                  ),
                                  Text(
                                    currencyFormatter.format(totalPriceForItem),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    const Divider(height: 3, color: Colors.black),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah Makanan"),
                        Text(
                          widget.totalQuantity.toStringAsFixed(0),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Total Pembayaran"),
                        Text(
                          currencyFormatter.format(widget.receiveTotalPrice),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Jumlah yang dibayarkan"),
                        Text(
                          currencyFormatter.format(widget.receivePaymnetTotal),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kembalian"),
                        Text(
                          currencyFormatter.format(widget.receivePaymentChange),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "--- LUNAS ---",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Terima kasih telah melakukan pembelian",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Text(
                      "Sampai ketemu kembali",
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
