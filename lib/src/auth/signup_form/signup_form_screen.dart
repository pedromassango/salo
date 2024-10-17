import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salo/src/auth/domain/signup_usecase.dart';
import 'package:salo/src/auth/signup_form/signup_form_screen_cubit.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/shared/app_picker.dart';
import 'package:salo/src/shared/gender.dart';

import '../../shared/resources.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final _formPagesCount = 3;
  final _pageController = PageController();

  void _onNext() {
    _nextPage();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 270),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return BlocProvider(
      create: (_) => SignupFormScreenCubit(
        signupUsecase: SignupUsecase(),
        getCategoriesUsecase: GetCategoriesUsecase(),
      ),
      child: BlocConsumer<SignupFormScreenCubit, SignupFormScreenCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Column(
                children: [
                  AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      final value = _pageController.hasClients
                          ? ((_pageController.page ?? 1.0) / _formPagesCount)
                          : .0;
                      return Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 24),
                        child: LinearProgressIndicator(
                          backgroundColor: accentColor,
                          color: primaryColor,
                          value: value,
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _PersonalDetailsForm(
                          onNext: _onNext,
                        ),
                        _LocationForm(
                          onNext: _onNext,
                        ),
                        const _CategoriesForm(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PersonalDetailsForm extends StatelessWidget {
  const _PersonalDetailsForm({
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SignupFormScreenCubit>();
    final state = bloc.state;
    return Builder(builder: (context) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Forneça seus dados pessoais'.toUpperCase(),
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: primaryColor,
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 54),
                      child: Text(
                        'Digite seus dados conforme eles aparecem no seu bilhete de identidade.',
                        style: GoogleFonts.roboto().copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    AppInputField(
                      label: 'Primeiro nome',
                      value: state.firstName,
                      keyboardType: TextInputType.name,
                      autofillHints: AutofillHints.givenName,
                      onChanged: bloc.onFirstNameChanged,
                    ),
                    const SizedBox(height: 24),
                    AppInputField(
                      label: 'Último nome',
                      value: state.lastName,
                      autofillHints: AutofillHints.familyName,
                      keyboardType: TextInputType.name,
                      onChanged: context
                          .read<SignupFormScreenCubit>()
                          .onLastNameChanged,
                    ),
                    const SizedBox(height: 32),
                    AppPicker<Gender>(
                      values: Gender.values,
                      valueTitleBuilder: (gender) => switch (gender) {
                        Gender.male => 'Masculino',
                        Gender.female => 'Feminino',
                      },
                      onChanged: bloc.onGenderChanged,
                      child: AppInputField(
                        label: 'Género',
                        readOnly: true,
                        value: state.gender?.localize,
                        key: ValueKey(state.gender),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: SaloButton.primary(
              title: 'Próximo',
              onPressed: state.isPersonalDataStepValid ? onNext : null,
            ),
          ),
        ],
      );
    });
  }
}

class _LocationForm extends StatelessWidget {
  const _LocationForm({
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SignupFormScreenCubit>();
    final state = bloc.state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Qual é o seu endereço?'.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 36,
                          fontWeight: FontWeight.w900,
                          color: primaryColor,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 32),
                    child: Text(
                      'Digite o endereço de sua residência e nós te ajudaremos a encontrar trabalhos na sua área.',
                      style: GoogleFonts.roboto().copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  AppInputField(
                    label: 'Província',
                    hint: 'Luanda',
                    autofocus: true,
                    value: state.province,
                    autofillHints: AutofillHints.addressCity,
                    keyboardType: TextInputType.streetAddress,
                    onChanged:
                        context.read<SignupFormScreenCubit>().onProvinceChanged,
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: 'Cidade',
                    hint: 'Benfica',
                    value: state.city,
                    autofillHints: AutofillHints.addressState,
                    keyboardType: TextInputType.streetAddress,
                    onChanged:
                        context.read<SignupFormScreenCubit>().onCityChanged,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: SaloButton.primary(
              title: 'Próximo',
              onPressed: state.isLocationStepValid ? onNext : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoriesForm extends StatefulWidget {
  const _CategoriesForm();

  @override
  State<_CategoriesForm> createState() => _CategoriesFormState();
}

class _CategoriesFormState extends State<_CategoriesForm> {
  @override
  void initState() {
    super.initState();
    context.read<SignupFormScreenCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<SignupFormScreenCubit>();
    final state = bloc.state;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              'Escolha os serviços que você realiza'.toUpperCase(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: primaryColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 16),
            child: Text(
              'Após o cadastro você poderá alterar as categorias escolhidas',
              style: GoogleFonts.roboto().copyWith(
                color: Colors.black54,
              ),
            ),
          ),
          Expanded(
            child: state.isLoadingCategories
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state.selectedMainCategory == null
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final item = state.categories[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black26),
                            ),
                            child: ListTile(
                              onTap: state.isCreatingAccount
                                  ? null
                                  : () => bloc.onMainCategoryChanged(item),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(16, 8, 16, 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  item.title,
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                              subtitle: Text(
                                item.message ?? '',
                                style: context.textTheme.titleMedium!.copyWith(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        clipBehavior: Clip.hardEdge,
                        itemCount: state.subcategories.length,
                        itemBuilder: (context, index) {
                          final item = state.subcategories.elementAt(index);
                          final checked = state.isSubcategorySelected(item);
                          return Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black26),
                            ),
                            child: ListTile(
                              onTap: () => bloc.onSubcategoriesChanged(item),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              contentPadding:
                                  const EdgeInsets.fromLTRB(16, 8, 16, 12),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  item.title,
                                  style: context.textTheme.titleLarge,
                                ),
                              ),
                              trailing: Checkbox(
                                value: checked,
                                fillColor:
                                    WidgetStateProperty.resolveWith((states) {
                                  return states.contains(WidgetState.selected)
                                      ? primaryColor
                                      : null;
                                }),
                                checkColor: accentColor,
                                side: const BorderSide(width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                onChanged: state.isCreatingAccount
                                    ? null
                                    : (v) => bloc.onSubcategoriesChanged(item),
                              ),
                              subtitle: Text(
                                item.message ?? '',
                                style: context.textTheme.titleMedium!.copyWith(
                                  color: Colors.black.withOpacity(.6),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SaloButton.primary(
              title: 'Criar conta',
              loading: state.isCreatingAccount,
              onPressed: state.canCreateAccount ? bloc.onCreateAccount : null,
            ),
          ),
        ],
      ),
    );
  }
}
