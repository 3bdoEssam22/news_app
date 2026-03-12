import 'dart:developer';
import 'package:news_app/core/constants/app_constants.dart';
import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class HomeRepo {
   Future<Object> getTopHeadLineArticles() async {
    try {
      final response = await DioHelper.getRequest(
        endpoint: ApiEndpoints.topHeadlinesEndpoint,
        query: {'country': 'us', 'apiKey': AppConstants.newsApiKey,},
      );
      if (response.statusCode == 200) {
        ArticlesModel topHeadLinesModel = ArticlesModel.fromJson(response.data);
        return topHeadLinesModel;
      }
    } catch (e) {
      log(e.toString());
      return Future.error(e.toString());
    }
    return Future.error('Failed to fetch top headline articles');
  }
}
