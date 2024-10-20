import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/shared/entities/category.dart';

part 'home_page_cubit.freezed.dart';

class HomePageCubit extends Cubit<HomePageCubitState> {
  HomePageCubit({
    required this.getCategoriesUsecase,
  }) : super(HomePageCubitState());

  final GetCategoriesUsecase getCategoriesUsecase;

  void init() {
    emit(HomePageCubitState(isLoading: true));

    emit(state.copyWith(
      isLoading: true,
    ));

    getCategoriesUsecase.call().then((categories) {
      emit(state.copyWith(
        isLoading: false,
        categories: categories,
      ));
    });
  }
}

@freezed
class HomePageCubitState with _$HomePageCubitState {
  const HomePageCubitState._();

  factory HomePageCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default([]) List<Category> categories,
  }) = _HomePageCubitState;

  Iterable<Category> get highlightedCategories => categories.take(5);
}
