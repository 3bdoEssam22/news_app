import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/widgets/custom_text_field.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool isSearchFieldTapped = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSearchFieldTapped
            ? CustomTextfield(
                width: 200.w,
                onFieldSubmitted: (value) {
                  GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.searchResultScreen, extra: value);
                },
              )
            : SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              isSearchFieldTapped = !isSearchFieldTapped;
            });
          },
          icon: Icon(Icons.search, color: Color(0xff231F20)),
        ),
      ],
    );
  }
}
