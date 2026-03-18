import 'package:dio/dio.dart';
import 'package:test4/models/artical_model/article_model.dart';
import 'package:test4/services/api_exceptions.dart';

class NewsService {
  final Dio dio;
  final String baseUrl = 'https://newsapi.org/v2';
  final String apiKey = 'dfc761f2991e4eae8f5d5ff9b558548f';

  NewsService({required this.dio});

  final List<ArticleModel> articleModelList = [];

  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/top-headlines?country=us&apiKey=$apiKey&category=$category',
      );

      final Map<String, dynamic> jsonData = response.data;

      final List<dynamic> articlesList = jsonData['articles'];

      for (var element in articlesList) {
        articleModelList.add(ArticleModel.fromJson(element));
      }

      return articleModelList;
    } on DioException catch (e) {
      throw ApiExceptions.handleDioException(e);
    }
  }
}
