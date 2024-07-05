import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/logic/bloc/post_bloc.dart';
import '/services/model/post_model.dart';
import '/services/repository/post_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
          create: (BuildContext context) => PostBloc(PostRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text("Post Content with Bloc")),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => PostBloc(PostRepository())..add(LoadPostEvent()),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostErrorState) {
            return const Center(
              child: Text("Error gagal memuat data"),
            );
          }
          if (state is PostLoadedState) {
            List<PostModel> postList = state.posts;
            return ListView.builder(
              itemCount: postList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Card(
                    color: Theme.of(context).primaryColor,
                    child: ListTile(
                      leading: Image.network(
                        "https://sanbercode.com/assets/img/identity/logo@2x.jpg",
                        height: 80,
                        width: 100,
                      ),
                      title: Text(
                        '${postList[index].title}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${postList[index].body}',
                        style: const TextStyle(color: Colors.white),
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
