import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/article_card_widget.dart';
import 'package:news_app/features/search_result_screen.dart/services/search_result_services.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: Text(
          'search_results'.tr(),
          style: AppTextStyles.black14SemiBold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: SearchResultServices.searchItemByName(query),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            ArticlesModel topHeadLinesModel =
                asyncSnapshot.data as ArticlesModel;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.sp),
              child: Column(
                children: [
                  HeightSpace(24.h),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: ListView.builder(
                        itemCount: topHeadLinesModel.articles?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          Article article = topHeadLinesModel.articles![index];
                          return ArticleCardWidget(article: article);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (asyncSnapshot.hasError) {
            return Center(child: Text('Error: ${asyncSnapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
