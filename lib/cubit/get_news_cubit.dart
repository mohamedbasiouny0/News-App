import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:test4/models/artical_model/article_model.dart';
import 'package:test4/services/api_error.dart';
import 'package:test4/services/news_service.dart';

part 'get_news_state.dart';

class GetNewsCubit extends Cubit<GetNewsState> {
  GetNewsCubit() : super(GetNewsLoading());

  Future<void> getNewsFunction({required String category}) async {
    try {
      List<ArticleModel> articleList = await NewsService(
        dio: Dio(),
      ).getTopHeadlines(category: category);
      emit(GetNewsSuccess(articalList: articleList));
    } on ApiError catch (e) {
      emit(GetNewsLFailure(errorMessage: e.message));
    }
  }
}
