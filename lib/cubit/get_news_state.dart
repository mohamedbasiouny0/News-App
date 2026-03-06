part of 'get_news_cubit.dart';

@immutable
sealed class GetNewsState {}

final class GetNewsSuccess extends GetNewsState {
  final List<ArticleModel> articalList;

  GetNewsSuccess({required this.articalList});
}

final class GetNewsLoading extends GetNewsState {}

final class GetNewsLFailure extends GetNewsState {
  final String errorMessage;

  GetNewsLFailure({required this.errorMessage});
}
