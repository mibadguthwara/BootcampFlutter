import 'package:flutter/material.dart';
import '/model/post.dart';
import '/repository/user_repository.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;
  const PostDetailScreen({super.key, required this.post});

  Padding _sectionBuilder(BuildContext context, String title, String subtitle) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.labelLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            subtitle,
            style: textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final TextTheme textTheme = Theme.of(context).textTheme;
    final UserRepository userRepository = UserRepository();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: colorScheme.primaryContainer.withOpacity(0.5),
        title: const Text('Detail'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: userRepository.getById(post.userId),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionBuilder(context, 'Title', post.title),
                    _sectionBuilder(context, 'Body', post.body),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Author',
                            style: textTheme.labelLarge!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            snapshot.data!.name,
                            style: textTheme.bodyMedium,
                          ),
                          Text(
                            snapshot.data!.email,
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
