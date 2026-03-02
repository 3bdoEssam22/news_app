import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

class ArticleCardWidget extends StatelessWidget {
  final Article article;
  const ArticleCardWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(
        context,
      ).pushNamed(AppRoutes.articleDetailsScreen, extra: article),
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 238.w,
                  child: Text(
                    maxLines: 2,
                    article.title ?? "No Title",
                    style: AppTextStyles.titleStyle.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.black,
                    ),
                  ),
                ),
                HeightSpace(16.h),
                SizedBox(
                  width: 238.w,
                  child: Text(
                    "${article.author} - ${article.publishedAt}",
                    style: AppTextStyles.grey12Medium,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 112.w,
              height: 80.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      'https://www.pngall.com/wp-content/uploads/5/News-PNG-High-Quality-Image.png',
                  fit: BoxFit.fill,
                  height: 206.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
