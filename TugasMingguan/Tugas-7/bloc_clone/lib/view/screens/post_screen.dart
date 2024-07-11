import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/bloc/post_bloc/post_bloc.dart';

import '/model/post.dart';

import '/view/screens/post_detail_screen.dart';

class PostScreen extends StatelessWidget {
  // final Widget drawer;
  // const PostScreen({super.key, required this.drawer});
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // drawer: drawer,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: colorScheme.primaryContainer.withOpacity(0.5),
        title: const Text('Newsletter App '),
      ),
      body: SafeArea(
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) {
              BlocProvider.of<PostBloc>(context).add(LoadPost());
            }
            if (state is PostLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostError) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is PostLoaded) {
              List<Post> posts = state.posts;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  PostDetailScreen(post: posts[index]))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(
                              posts[index].title,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: textTheme.titleMedium,
                            ),
                            subtitle: Text(
                              posts[index].body,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
