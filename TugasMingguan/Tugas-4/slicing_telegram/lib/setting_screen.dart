import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const routeName = '/setting_screen';
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        title: const Text("Settings"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.mode_edit_outline_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/photo_profile.jpg",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "M Ibad Guthwara",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Text("Online"),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              padding: const EdgeInsets.all(10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Account",
                    style: TextStyle(color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("@mibadguthwara"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android),
                    title: Text("+62 896 5271  9053"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(color: Colors.black),
                  ),
                  ListTile(
                    leading: const Icon(Icons.message),
                    title: const Text("Chat Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text("Privacy and Security"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.notifications),
                    title: const Text("Notifications and Sounds"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.storage),
                    title: const Text("Data and Storage"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.battery_charging_full_outlined),
                    title: const Text("Power Saving"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text("Chat Folders"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.devices),
                    title: const Text("Devices"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.language),
                    title: const Text("Language"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.star_border_purple500_rounded,
                      color: Colors.purple,
                    ),
                    title: const Text("Telegram Premium"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.business_center_sharp),
                    title: const Text("Telegram Business"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.card_giftcard),
                    title: const Text("Gift Premium"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Help",
                    style: TextStyle(color: Colors.black),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.message_outlined,
                    ),
                    title: const Text("Ask a Question"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.question_mark),
                    title: const Text("Telegram FAQ"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.security_rounded),
                    title: const Text("Privacy Policy"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
