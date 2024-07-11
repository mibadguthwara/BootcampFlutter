part of 'pages.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({super.key});

  final List? data = [
    {"id": "1", "name": "Akhyar", "address": "Padang Panjang"},
    {"id": "2", "name": "Rahimah", "address": "Yogyakarta", "status": 0},
    {"id": "3", "name": "Ibad", "address": "Batam", "status": 0},
    {"id": "4", "name": "Amy", "address": "Bandung", "status": 0},
    {"id": "5", "name": "Uwais", "address": "Bandung", "status": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ListView",
        ),
        backgroundColor: Colors.amber,
      ),
      drawer: const DrawerScreen(),
      body: SafeArea(
        child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: data?.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // ignore: avoid_print
                print(data?[index]['id']);
              },
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text(data?[index]['name']),
                subtitle: Row(
                  children: [
                    data?[index]['status'] == 1
                        ? const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : const Text(""),
                    Text(data?[index]['address']),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            );
          },
        ),
      ),
    );
  }
}
