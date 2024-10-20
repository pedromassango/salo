import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/shared/entities/category.dart';

part 'category_selector_dialog_cubit.freezed.dart';

const maxOfCategoriesPerProfessional = 3;

class CategorySelectorDialogCubit
    extends Cubit<CategorySelectorDialogCubitState> {
  CategorySelectorDialogCubit({
    required this.getCategoriesUsecase,
  }) : super(CategorySelectorDialogCubitState());

  final GetCategoriesUsecase getCategoriesUsecase;

  void init() {
    emit(CategorySelectorDialogCubitState(isLoading: true));

    getCategoriesUsecase.call().then((categories) {
      emit(state.copyWith(
        isLoading: false,
        categories: categories,
      ));
    }).catchError((error, _) {
      debugPrint('Profile loading failed: $error');

      emit(state.copyWith(
        isLoading: false,
        hasError: true,
      ));
    });
  }

  void onMainCategoryChanged(Category category) =>
      emit(state.copyWith(selectedMainCategory: category));

  void onSubcategoriesChanged(Category category) {
    final selection = List.of(state.selectedSubCategories);
    if (state.isSubcategorySelected(category)) {
      selection.removeWhere((item) => item.id == category.id);
      emit(state.copyWith(selectedSubCategories: selection));
    } else if (selection.length < maxOfCategoriesPerProfessional) {
      selection.add(category);
      emit(state.copyWith(selectedSubCategories: selection));
    }
  }

  void onSave() {
    if (state.isLoading || state.isSaving) {
      return;
    }

    emit(state.copyWith(isSaving: true));

    // TODO: move this into a Firebase function
    final currentUser = FirebaseAuth.instance.currentUser;
    final ids = state.selectedSubCategories.map((item) => item.id);

    final payload = {
      'categoryId': state.selectedMainCategory?.id,
      'subcategoryIds': ids,
      'categoryTitle':
          state.selectedMainCategory?.getTitle(state.selectedSubCategories),
    };

    FirebaseFirestore.instance
        .collection('${appFlavor}_users')
        .doc(currentUser?.uid ?? '')
        .set(payload, SetOptions(merge: true))
        .then((_) async {
      // Subscribe to get notification about these categories
      final topics = [state.selectedMainCategory?.id ?? '', ...ids];

      for (final id in topics) {
        await FirebaseMessaging.instance.subscribeToTopic(id);
      }

      debugPrint('Category updated');
      emit(state.copyWith(
        saved: true,
        isSaving: false,
      ));
    }).onError((error, _) {
      debugPrint('Category saving failed');

      emit(state.copyWith(
        saved: true,
        isSaving: false,
      ));
    });
  }
}

@freezed
class CategorySelectorDialogCubitState with _$CategorySelectorDialogCubitState {
  const CategorySelectorDialogCubitState._();

  factory CategorySelectorDialogCubitState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default(false) bool saved,
    @Default(false) bool hasError,
    Category? selectedMainCategory,
    @Default([]) List<Category> categories,
    @Default(<Category>[]) List<Category> selectedSubCategories,
  }) = _CategorySelectorDialogCubitState;

  bool isSubcategorySelected(Category category) =>
      selectedSubCategories.firstWhereOrNull((i) => i.id == category.id) !=
      null;

  List<Category> get subcategories => selectedMainCategory?.subcategories ?? [];

  bool get canSave =>
      selectedMainCategory != null &&
      selectedSubCategories.length == maxOfCategoriesPerProfessional;
}
