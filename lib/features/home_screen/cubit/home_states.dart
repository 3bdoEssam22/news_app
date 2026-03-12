import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}
class LoadingTopHeadLinesState extends HomeStates {}
class SuccessTopHeadLinesState extends HomeStates {
  final ArticlesModel topHeadLinesModel;

  SuccessTopHeadLinesState(this.topHeadLinesModel);
}
class ErrorTopHeadLinesState extends HomeStates {
  final String errorMessage;

  ErrorTopHeadLinesState(this.errorMessage);
}
