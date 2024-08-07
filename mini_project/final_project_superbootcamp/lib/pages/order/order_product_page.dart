import 'package:final_project_superbootcamp/pages/main_page.dart';
import 'package:final_project_superbootcamp/pages/order/order_payment_page.dart';
import 'package:final_project_superbootcamp/widgets/date_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderProductPage extends StatefulWidget {
  const OrderProductPage({super.key});

  @override
  State<OrderProductPage> createState() => _OrderProductPageState();
}

class _OrderProductPageState extends State<OrderProductPage> {
  int priceItems = 3000;
  int stockItems = 40;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter >= stockItems) {
        _counter = stockItems;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      if (_counter <= 0) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final String formattedPriceItems =
        NumberFormat("#,###", "id_ID").format(priceItems);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Product"),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const MainPage();
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Cancel Transaction, Success.'),
                            ),
                          );
                        },
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const DateDisplayWidget(),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Name Customer",
                    focusedBorder: OutlineInputBorder(),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 15),
                Chip(
                  label: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.shopping_basket),
                            const SizedBox(width: 5),
                            Text(
                              "$_counter",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Total Price:"),
                            const SizedBox(width: 5),
                            Text(
                              "Rp ${priceItems * _counter}",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(height: 3, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, top: 8, bottom: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Lemper Ayam",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp $formattedPriceItems",
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text("Stock: "),
                              Text(
                                "${stockItems - _counter}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: _decrementCounter,
                                icon: const Icon(Icons.indeterminate_check_box),
                              ),
                              Text(
                                "$_counter",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                onPressed: _incrementCounter,
                                icon: const Icon(Icons.add_box),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Rp ${priceItems * _counter}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(height: 3, color: Colors.black),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12, top: 8, bottom: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kue Sus",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Rp 4.000",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Stock: "),
                              Text(
                                "15",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.indeterminate_check_box)),
                              const Text(
                                "0",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_box))
                            ],
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Rp 0",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(height: 3, color: Colors.black),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const OrderPaymentPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              label: const Text(
                "Next Payment Method",
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.payment,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
