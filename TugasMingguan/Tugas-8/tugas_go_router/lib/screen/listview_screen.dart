import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'listview_detail_screen.dart';
import '/logic/user_bloc/user_bloc.dart';
import '/services/repository/user_repository.dart';
import '/services/model/user_model.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('ListView dari pengayaan 13')),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository())..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(
              child: Text("Error"),
            );
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListViewDetailScreen(user: userList[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            userList[index].avatar.toString(),
                          ),
                        ),
                        title: Text(
                          '${userList[index].firstName} ${userList[index].lastName}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          '${userList[index].email}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
