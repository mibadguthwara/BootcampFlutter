part of 'news_org_bloc.dart';

sealed class NewsOrgState extends Equatable {
  const NewsOrgState();
  @override
  List<Object> get props => [];
}

final class NewsOrgInitial extends NewsOrgState {}

class NewsLoadingState extends NewsOrgState {
  @override
  List<Object> get props => [];
}

class NewsLoadedState extends NewsOrgState {
  final List<NewsOrgModel> news;
  const NewsLoadedState(this.news);

  @override
  List<Object> get props => [];
}

class NewsErrorState extends NewsOrgState {
  final String error;

  const NewsErrorState(this.error);

  @override
  List<Object> get props => [];
}
