import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/shared/gender.dart';

import '../domain/signup_usecase.dart';

part 'signup_form_screen_cubit.freezed.dart';

class SignupFormScreenCubit extends Cubit<SignupFormScreenCubitState> {
  SignupFormScreenCubit({
    required this.getCategoriesUsecase,
    required this.signupUsecase,
  }) : super(SignupFormScreenCubitState());

  final GetCategoriesUsecase getCategoriesUsecase;
  final SignupUsecase signupUsecase;

  void init() {
    emit(state.copyWith(
      isCreatingAccount: false,
      isAccountCreated: false,
      isLoadingCategories: true,
      selectedMainCategory: null,
      categories: [],
    ));

    getCategoriesUsecase.call().then((categories) {
      emit(state.copyWith(
        isLoadingCategories: false,
        categories: categories,
      ));
    });
  }

  void onFirstNameChanged(String name) => emit(state.copyWith(firstName: name));

  void onLastNameChanged(String name) => emit(state.copyWith(lastName: name));

  void onGenderChanged(Gender gender) => emit(state.copyWith(gender: gender));

  void onProvinceChanged(String province) =>
      emit(state.copyWith(province: province));

  void onCityChanged(String city) => emit(state.copyWith(city: city));

  void onMainCategoryChanged(Category category) =>
      emit(state.copyWith(selectedMainCategory: category));

  void onSubcategoriesChanged(Category category) {
    const maxOfCategoriesPerProfessional = 3;

    final selection = List.of(state.selectedSubCategories);
    if (state.isSubcategorySelected(category)) {
      selection.removeWhere((item) => item.title == category.title);
      emit(state.copyWith(
        isCreatingAccount: false,
        selectedSubCategories: selection,
      ));
    } else if (selection.length <= maxOfCategoriesPerProfessional) {
      selection.add(category);
      emit(state.copyWith(
        isCreatingAccount: false,
        selectedSubCategories: selection,
      ));
    }
  }

  void onCreateAccount() {
    if (state.isCreatingAccount || !state.canCreateAccount) {
      return;
    }

    emit(state.copyWith(
      isCreatingAccount: true,
      isAccountCreated: false,
    ));

    signupUsecase
        .call(
      firstName: state.firstName,
      lastName: state.lastName,
      province: state.province,
      city: state.city,
      gender: state.gender!,
      selectedMainCategory: state.selectedMainCategory!,
      selectedSubCategories: state.selectedSubCategories,
    )
        .then((isRegistered) {
      emit(state.copyWith(
        isCreatingAccount: false,
        isAccountCreated: isRegistered,
      ));
    });
  }
}

@freezed
class SignupFormScreenCubitState with _$SignupFormScreenCubitState {
  const SignupFormScreenCubitState._();

  factory SignupFormScreenCubitState({
    @Default('') String firstName,
    @Default('') String lastName,
    Gender? gender,
    @Default('') String province,
    @Default('') String city,
    @Default(false) bool isCreatingAccount,
    @Default(false) bool isAccountCreated,
    @Default(false) bool isLoadingCategories,
    @Default(<Category>[]) List<Category> categories,
    Category? selectedMainCategory,
    @Default(<Category>[]) List<Category> selectedSubCategories,
  }) = _SignupFormScreenCubitState;

  bool isSubcategorySelected(Category category) =>
      selectedSubCategories
          .firstWhereOrNull((i) => i.title == category.title) !=
      null;

  bool get isPersonalDataStepValid =>
      firstName.trim().isNotEmpty &&
      lastName.trim().isNotEmpty &&
      gender != null;

  bool get isLocationStepValid =>
      province.trim().isNotEmpty && city.trim().isNotEmpty;

  bool get canCreateAccount =>
      isCategoriesStepValid && isLocationStepValid && isPersonalDataStepValid;

  List<Category> get subcategories => selectedMainCategory?.subcategories ?? [];

  bool get isCategoriesStepValid =>
      selectedMainCategory != null && selectedSubCategories.isNotEmpty;
}
