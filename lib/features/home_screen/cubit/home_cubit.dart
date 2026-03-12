import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/cubit/home_states.dart';
import 'package:news_app/features/home_screen/models/top_head_lines_model.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepo homeRepo = HomeRepo();

  Future<void> GetTopHeadLines() async {
    emit(LoadingTopHeadLinesState());
    try {
      final response = await homeRepo.getTopHeadLineArticles() as ArticlesModel;
      emit(SuccessTopHeadLinesState(response));
    } catch (e) {
      emit(ErrorTopHeadLinesState(e.toString()));
    }
  }
}
