import '/bloc/news_org_bloc.dart';
import '/models/news_org_model.dart';
import '/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsOrgScreen extends StatelessWidget {
  const NewsOrgScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Org Screen")),
      body: SizedBox(
        height: MediaQuery.of(context).size.height / 1,
        child: BlocProvider(
          create: (context) => NewsOrgBloc(NewsServices())
            ..add(
              LoadNewsEvent(),
            ),
          child: BlocBuilder<NewsOrgBloc, NewsOrgState>(
            builder: (context, state) {
              print("isinya: $state");
              if (state is NewsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NewsErrorState) {
                return const Center(
                  child: Text("Error"),
                );
              }
              if (state is NewsLoadedState) {
                List<NewsOrgModel> newsModel = state.news;
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    itemCount: newsModel.length,
                    itemBuilder: (context, index) {
                      var data = newsModel[index];
                      return Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Text(
                                data.title.toString(),
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                data.urlToImage != null
                                    ? data.urlToImage.toString()
                                    : "https://www.mobil-mitsubishi.co.id/wp-content/uploads/2023/03/1636383523-new-front-bumper-grille-designjpg.jpg",
                              ),
                              const SizedBox(height: 5),
                              Text(data.description.toString()),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
