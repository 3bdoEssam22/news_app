import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Article article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.red,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: 430.w,
                height: 316.h,
                child: CachedNetworkImage(
                  imageUrl:
                      article.urlToImage ??
                      'https://www.pngall.com/wp-content/uploads/5/News-PNG-High-Quality-Image.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.black),
                    onPressed: () => GoRouter.of(context).pop(),
                  ),
                ),
              ),
              Positioned(
                top: 300.h,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24.r),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          article.title ?? "",
                          style: AppTextStyles.titleStyle.copyWith(
                            fontSize: 20.sp,
                            color: AppColors.black,
                          ),
                        ),
                        HeightSpace(16.h),
                        Text(
                          "${article.author} - ${DateFormat('dd MMM yyyy').format(article.publishedAt!)}",
                          style: AppTextStyles.grey12Medium.copyWith(
                            fontSize: 16.sp,
                            color: AppColors.grey,
                          ),
                        ),
                        HeightSpace(24.h),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            "${article.description}\n\n${article.content}",
                            style: AppTextStyles.grey12Medium.copyWith(
                              fontSize: 16.sp,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
