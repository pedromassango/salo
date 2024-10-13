import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salo/src/shared/app_picker.dart';

import '../shared/resources.dart';

enum _FormStep { name, address, categories }

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final _pageController = PageController();
  String _firstAndLastName = '';
  String _location = '';
  final List<String> _categories = [];

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
      // For the back button
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: kToolbarHeight * 2,
          left: 32,
          right: 32,
          bottom: 16,
        ),
        child: PageView(
          controller: _pageController,
          children: [
            _PersonalDetailsForm(
              onNext: _onNext,
              onChanged: (v) => _firstAndLastName = v,
            ),
            _LocationForm(
              onNext: _onNext,
              onChanged: (v) => _location = v,
            ),
          ],
        ),
      ),
    );
  }
}

class _PersonalDetailsForm extends StatefulWidget {
  const _PersonalDetailsForm({
    super.key,
    required this.onNext,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onNext;

  @override
  State<_PersonalDetailsForm> createState() => _PersonalDetailsFormState();
}

class _PersonalDetailsFormState extends State<_PersonalDetailsForm> {
  bool _isValid = false;
  String _gender = '';
  void _validateInput(String value) {
    setState(() => _isValid = value.trim().isNotEmpty);
    if (_isValid) {
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
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
                  onChanged: (v) {},
                ),
                const SizedBox(height: 24),
                AppInputField(
                  label: 'Último nome',
                  onChanged: (v) {},
                ),
                const SizedBox(height: 32),
                AppPicker(
                  values: {'Masculino', 'Feminino'},
                  onChanged: (value) {
                    setState(() => _gender = value);
                  },
                  child: AppInputField(
                    label: 'Género',
                    value: _gender,
                    key: ValueKey(_gender),
                    trailing: Icon(
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
        SaloButton.primary(
          title: 'Próximo',
          onPressed: _isValid ? widget.onNext : null,
        ),
      ],
    );
  }
}

class _LocationForm extends StatefulWidget {
  const _LocationForm({
    super.key,
    required this.onNext,
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;
  final VoidCallback onNext;

  @override
  State<_LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<_LocationForm> {
  bool _isValid = false;

  void _validateInput(String value) {
    setState(() => _isValid = value.trim().isNotEmpty);
    if (_isValid) {
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  padding: const EdgeInsets.only(top: 8, bottom: 54),
                  child: Text(
                    'Apenas a cidade será visível para seus clientes.',
                    style: GoogleFonts.roboto().copyWith(
                      color: Colors.black54,
                    ),
                  ),
                ),
                AppInputField(
                  label: 'Província',
                  hint: 'Luanda',
                  onChanged: (v) {},
                ),
                const SizedBox(height: 16),
                AppInputField(
                  label: 'Cidade',
                  hint: 'Estalagem',
                  onChanged: (v) {},
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
    );
  }
}
