import 'package:flutter/material.dart';
import 'item.dart';
import 'receipt_screen.dart';

class OrderPaymentPage extends StatefulWidget {
  final String receiveNameCustomer;
  final int totalQuantity;
  final double totalPrice;
  final List<Item> receiveItems;

  const OrderPaymentPage({
    super.key,
    required this.receiveNameCustomer,
    required this.totalQuantity,
    required this.totalPrice,
    required this.receiveItems,
  });

  @override
  State<OrderPaymentPage> createState() => _OrderPaymentPageState();
}

class _OrderPaymentPageState extends State<OrderPaymentPage> {
  final TextEditingController inputPaymentNominal = TextEditingController();
  final TextEditingController nameCustomerOrder = TextEditingController();
  String _selectedValue = 'option1';

  int _changePayment = 0;

  @override
  void initState() {
    super.initState();

    inputPaymentNominal.addListener(_updateHasilPengurangan);
  }

  void _updateHasilPengurangan() {
    final String price = widget.totalPrice.toString();
    final String text = inputPaymentNominal.text;
    final int priceNominal = int.tryParse(price) ?? 0;
    final int nominal = int.tryParse(text) ?? 0;

    setState(() {
      _changePayment = nominal - priceNominal;
    });
  }

  @override
  void dispose() {
    inputPaymentNominal.removeListener(_updateHasilPengurangan);
    inputPaymentNominal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Pembayaran"),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm'),
                    content:
                        const Text('Are you sure to cancel this transaction?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 15),
              Chip(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        "Nama Pelanggan:",
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.receiveNameCustomer,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Chip(
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.shopping_basket_outlined),
                          const SizedBox(width: 5),
                          Text(
                            widget.totalQuantity.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Rp",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.totalPrice.toStringAsFixed(0),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              RadioListTile<String>(
                title: Text(
                  'Tunai (Cash)',
                  style: TextStyle(
                    fontWeight: _selectedValue == 'option1'
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                selected: true,
                value: 'option1',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: Text(
                  'QRIS (Cashless)',
                  style: TextStyle(
                    fontWeight: _selectedValue == 'option2'
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                value: 'option2',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
              ),
              const SizedBox(height: 15),
              _selectedValue == 'option1'
                  ? _buildCashPayment()
                  : _buildCashlessPayment(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCashPayment() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 0,
              child: Text(
                "Jumlah yang dibayarkan",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: inputPaymentNominal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Nominal (Rp)",
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.monetization_on_sharp),

                  isDense: true,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Kembalian:",
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Rp"),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text(
                    "$_changePayment",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: () {
            final sendPaymentNominalData = inputPaymentNominal.text;

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ReceiptScreen(
                    receiveNameCustomer: widget.receiveNameCustomer,
                    receivePaymentMethod: "Tunai (Cash)",
                    receivePaymnetTotal: sendPaymentNominalData,
                    receivePaymentChange: _changePayment.toString(),
                    // receivePaymentChange: "Rp 10000",
                    receiveItems: widget.receiveItems,
                    totalQuantity: widget.totalQuantity,
                    receiveTotalPrice: widget.totalPrice,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          label: const Text(
            "Konfirmasi Pembayaran Tunai (Cash)",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.payments_outlined,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildCashlessPayment() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 0,
              child: Text(
                "Jumlah yang dibayarkan",
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: inputPaymentNominal,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Nominal (Rp)",
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                  // prefixIcon: Icon(Icons.monetization_on_sharp),

                  isDense: true,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Merchant",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Wangisari Kue",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "NMID",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "ID1989000008900",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 15),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Status",
              style: TextStyle(fontSize: 16),
            ),

            /// clip loading
            // Chip(
            //   avatar: Icon(Icons.update),
            //   label: Text("Waiting for information"),
            //   backgroundColor: Colors.yellow,
            // ),

            // / clip success
            Chip(
              avatar: Icon(
                Icons.done,
                color: Colors.white,
              ),
              label: Text("Payment Success"),
              labelStyle: TextStyle(color: Colors.white),
              backgroundColor: Colors.green,
            ),
          ],
        ),
        const SizedBox(height: 40),
        ElevatedButton.icon(
          onPressed: () {
            final sendPaymentNominalData = inputPaymentNominal.text;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ReceiptScreen(
                    receiveNameCustomer: widget.receiveNameCustomer,
                    receivePaymentMethod: "QRIS (Cashless)",
                    receiveItems: widget.receiveItems,
                    totalQuantity: widget.totalQuantity,
                    receiveTotalPrice: widget.totalPrice,
                    receivePaymentChange: 'Rp 0',
                    receivePaymnetTotal: sendPaymentNominalData,
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          label: const Text(
            "Konfirmasi Pembayaran QRIS (Cashless)",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.qr_code_2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
