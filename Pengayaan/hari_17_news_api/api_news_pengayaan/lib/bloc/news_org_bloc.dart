// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/news_org_model.dart';
import '../services/news_services.dart';

part 'news_org_event.dart';
part 'news_org_state.dart';

class NewsOrgBloc extends Bloc<NewsOrgEvent, NewsOrgState> {
  final NewsServices _newsServices;
  NewsOrgBloc(this._newsServices) : super(NewsOrgInitial()) {
    on<LoadNewsEvent>(
      (event, emit) async {
        emit(NewsLoadingState());
        try {
          final news = await _newsServices.getNews();
          emit(NewsLoadedState(news));
        } catch (e) {
          emit(NewsErrorState(e.toString()));
        }
      },
    );
  }
}
