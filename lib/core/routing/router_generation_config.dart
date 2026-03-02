import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/features/home_screen/article_details_screen.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/search_result_screen.dart/search_result_screen.dart';

class RouterGenerationConfig {
  static GoRouter createRouter() {
    return GoRouter(
      initialLocation: AppRoutes.homeScreen,
      routes: [
        GoRoute(
          path: AppRoutes.homeScreen,
          name: AppRoutes.homeScreen,
          builder: (context, state) => HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.searchScreen,
          name: AppRoutes.searchScreen,
          builder: (context, state) => Container(),
        ),
        GoRoute(
          path: AppRoutes.searchResultScreen,
          name: AppRoutes.searchResultScreen,
          builder: (context, state) {
            return SearchResultScreen(query: state.extra as String);
          },
        ),
        GoRoute(
          path: AppRoutes.articleDetailsScreen,
          name: AppRoutes.articleDetailsScreen,
          builder: (context, state) =>
              ArticleDetailsScreen(article: state.extra as Article),
        ),
      ],
    );
  }
}
