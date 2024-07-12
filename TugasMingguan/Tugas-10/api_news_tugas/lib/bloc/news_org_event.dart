part of 'news_org_bloc.dart';

sealed class NewsOrgEvent extends Equatable {}

class LoadNewsEvent extends NewsOrgEvent {
  @override
  List<Object?> get props => [];
}
