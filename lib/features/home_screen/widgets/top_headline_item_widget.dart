import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';

class TopHeadlineItemWidget extends StatelessWidget {
  const TopHeadlineItemWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.date,
  });
  final String title;
  final String? imageUrl;
  final String authorName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl:
                  imageUrl ??
                  'https://www.pngall.com/wp-content/uploads/5/News-PNG-High-Quality-Image.png',
              fit: BoxFit.fill,
              height: 206.h,
            ),
          ),
        ),
        HeightSpace(16),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.titleStyle.copyWith(
            fontSize: 18.sp,
            color: AppColors.black,
          ),
        ),
        HeightSpace(16.h),
        Text("$authorName - $date", style: AppTextStyles.grey12Medium),
      ],
    );
  }
}
