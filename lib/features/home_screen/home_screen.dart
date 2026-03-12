import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/constants/app_constants.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/home_screen/widgets/search_text_field.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().GetTopHeadLines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE9EEFA),
        toolbarHeight: 120.h,
        title: Text('Explore'.tr(), style: AppTextStyles.titleStyle),
        actions: [
          SearchTextField(),
          IconButton(
            onPressed: () {
              if (context.locale.languageCode == 'en') {
                context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('en'));
              }
              AppConstants.lang = context.locale.languageCode;
            },
            icon: Icon(Icons.language, color: Color(0xff231F20)),
          ),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeStates>(
        builder: (context, state) {
          if (state is LoadingTopHeadLinesState) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.black),
            );
          } else if (state is ErrorTopHeadLinesState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else if (state is SuccessTopHeadLinesState) {
            ArticlesModel topHeadLinesModel = state.topHeadLinesModel;
            return Column(
              children: [
                HeightSpace(16.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        CustomCategoryItemWidget(
                          title: "travel".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'travel',
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "technology".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'technology',
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "business".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'business',
                            );
                          },
                        ),
                        CustomCategoryItemWidget(
                          title: "entertainment".tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: 'entertainment',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                HeightSpace(24.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      TopHeadlineItemWidget(
                        title:
                            topHeadLinesModel.articles?[0].title ?? "No Title",
                        imageUrl:
                            topHeadLinesModel.articles?[0].urlToImage ?? "",
                        authorName:
                            topHeadLinesModel.articles?[0].author ??
                            "Unknown Author",
                        date: topHeadLinesModel.articles?[0].publishedAt != null
                            ? DateFormat('dd MMM yyyy').format(
                                topHeadLinesModel.articles![0].publishedAt!,
                              )
                            : "Unknown Date",
                      ),
                    ],
                  ),
                ),

                HeightSpace(24.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: ListView.builder(
                      itemCount: topHeadLinesModel.articles?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TopHeadlineItemWidget(
                          title:
                              topHeadLinesModel.articles?[index].title ??
                              "No Title",
                          imageUrl:
                              topHeadLinesModel.articles?[index].urlToImage ??
                              "",
                          authorName:
                              topHeadLinesModel.articles?[index].author ??
                              "Unknown Author",
                          date:
                              topHeadLinesModel.articles?[index].publishedAt !=
                                  null
                              ? DateFormat('dd MMM yyyy').format(
                                  topHeadLinesModel
                                      .articles![index]
                                      .publishedAt!,
                                )
                              : "Unknown Date",
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ErrorTopHeadLinesState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
