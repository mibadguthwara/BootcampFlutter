part of 'pages.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          switch (state.index) {
            case 0:
              return const HomeScreen(extra: 'extra');
            case 1:
              return ListViewScreen();
            default:
              return const HomeScreen(extra: 'extra');
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: context.watch<BottomNavCubit>().state.index,
        onTap: (value) {
          context.read<BottomNavCubit>().navigateTo(index: value);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "ListView"),
        ],
        selectedItemColor: Colors.blue,
      ),
    );
  }
}
