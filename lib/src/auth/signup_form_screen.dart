import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salo/src/shared/app_picker.dart';

import '../get_categories_usecase.dart';
import '../shared/resources.dart';

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
  Widget build(BuildContext context) {
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
                children: [
                  _PersonalDetailsForm(
                    onNext: _onNext,
                  ),
                  _LocationForm(
                    onNext: _onNext,
                  ),
                  _CategoriesForm(
                    onNext: _onNext,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalDetailsForm extends StatefulWidget {
  const _PersonalDetailsForm({
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<_PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<_PersonalDetailsForm> {
  bool get _isValid =>
      _firstName.trim().isNotEmpty &&
      _lastName.trim().isNotEmpty &&
      _gender.trim().isNotEmpty;

  String _gender = '';
  String _firstName = '';
  String _lastName = '';

  @override
  Widget build(BuildContext context) {
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
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                    keyboardType: TextInputType.name,
                    autofillHints: AutofillHints.givenName,
                    onChanged: (v) => setState(() => _firstName = v),
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: 'Último nome',
                    autofillHints: AutofillHints.familyName,
                    keyboardType: TextInputType.name,
                    onChanged: (v) => setState(() => _lastName = v),
                  ),
                  const SizedBox(height: 32),
                  AppPicker(
                    values: const {'Masculino', 'Feminino'},
                    onChanged: (value) {
                      setState(() => _gender = value);
                    },
                    child: AppInputField(
                      label: 'Género',
                      value: _gender,
                      key: ValueKey(_gender),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.black26,
                      ),
                      readOnly: true,
                      onChanged: (v) {},
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
            onPressed: _isValid ? widget.onNext : null,
          ),
        ),
      ],
    );
  }
}

class _LocationForm extends StatefulWidget {
  const _LocationForm({
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<_LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<_LocationForm> {
  bool get _isValid => _province.trim().isNotEmpty && _city.trim().isNotEmpty;

  String _province = '';
  String _city = '';

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.only(top: 8, bottom: 42),
                    child: Text(
                      '',
                      style: GoogleFonts.roboto().copyWith(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  AppInputField(
                    label: 'Província',
                    hint: 'Luanda',
                    autofillHints: AutofillHints.addressCity,
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (v) => setState(() => _province = v),
                  ),
                  const SizedBox(height: 24),
                  AppInputField(
                    label: 'Cidade',
                    hint: 'Estalagem',
                    autofillHints: AutofillHints.addressState,
                    keyboardType: TextInputType.streetAddress,
                    onChanged: (v) => setState(() => _city = v),
                  ),
                ],
              ),
            ),
          ),
          SaloButton.primary(
            title: 'Próximo',
            onPressed: _isValid ? widget.onNext : null,
          ),
        ],
      ),
    );
  }
}

class _CategoriesForm extends StatefulWidget {
  const _CategoriesForm({
    required this.onNext,
  });

  final VoidCallback onNext;

  @override
  State<_CategoriesForm> createState() => _CategoriesFormState();
}

class _CategoriesFormState extends State<_CategoriesForm> {
  bool get _isValid => _subcategories.isNotEmpty;

  Category? _selected;
  final List<Category> _categories = [];
  final List<Category> _subcategories = [];

  void _preloadCategories() async {
    GetCategoriesUsecase().call().then((categories) {
      _categories.addAll(categories);
      setState(() {});
    });
  }

  void _onItemSelected(Category item) {
    final checked = _subcategories.contains(item);

    if (checked) {
      _subcategories.remove(item);
    } else {
      _subcategories.add(item);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _preloadCategories();
  }

  @override
  Widget build(BuildContext context) {
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
            child: _selected == null
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final item = _categories[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: ListTile(
                          onTap: () => setState(() => _selected = item),
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
                    itemCount: _selected?.subcategories.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = _selected!.subcategories.elementAt(index);
                      final checked = _subcategories.contains(item);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: ListTile(
                          onTap: () => _onItemSelected(item),
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
                            onChanged: (v) => _onItemSelected(item),
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
              title: 'Próximo',
              onPressed: _isValid ? widget.onNext : null,
            ),
          ),
        ],
      ),
    );
  }
}
