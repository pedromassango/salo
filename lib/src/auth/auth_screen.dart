import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/resources.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final minPhoneNumberLength = 9;

  // TODO: add support to more country codes.
  final String _selectedCountryCode = '+244';
  String _phoneNumber = '';

  String get _sanitizedPhoneNumber =>
      _phoneNumber.startsWith(_selectedCountryCode)
          ? _phoneNumber
          : _selectedCountryCode + _phoneNumber;

  bool get _isNumberValid => _phoneNumber.trim().length >= minPhoneNumberLength;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // For the back button
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Qual é o seu número?'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: primaryColor,
                          ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 60,
                          child: TextField(
                            controller: TextEditingController(
                              text: _selectedCountryCode,
                            ),
                            readOnly: true,
                            canRequestFocus: false,
                            enableInteractiveSelection: false,
                            textAlign: TextAlign.center,
                            style: context.textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                            ),
                            decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                              disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              left: 16,
                            ),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              autofillHints: const [
                                AutofillHints.telephoneNumber
                              ],
                              onTapOutside: (_) {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              style: context.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                              onChanged: (v) =>
                                  setState(() => _phoneNumber = v),
                              decoration: InputDecoration(
                                hintText: "Número de telefone",
                                hintStyle:
                                    context.textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black12),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        right: 32,
                      ),
                      child: Text(
                        "Seu telefone permitirá que você faça login com segurança e seja contactado por seus clientes!",
                        style: GoogleFonts.roboto().copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SaloButton.primary(
              height: 56,
              title: 'Confirmar',
              onPressed: _isNumberValid
                  ? () {
                      context.push('/auth/verify',
                          extra: _sanitizedPhoneNumber);
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
