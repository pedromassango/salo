import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../shared/resources.dart';

class PhoneValidationScreen extends StatefulWidget {
  const PhoneValidationScreen({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<PhoneValidationScreen> createState() => _PhoneValidationScreenState();
}

class _PhoneValidationScreenState extends State<PhoneValidationScreen> {
  final _inputFocusNode = FocusNode();
  final _maxPinLength = 6;

  void _onPinSubmitted(BuildContext context, String pin) {
    _onPhoneValidated(context);
  }

  void _onPhoneValidated(BuildContext context) {
    context.push('/auth/signup');
  }

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.requestFocus(_inputFocusNode);
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldLargeStyle = context.textTheme.displayLarge!.copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w900,
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // For the back button
      appBar: AppBar(),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 32,
          right: 32,
          bottom: 16,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Text(
                        'Digite o código que foi enviado por sms'.toUpperCase(),
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: primaryColor,
                            ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: PinCodeTextField(
                        autoUnfocus: true,
                        cursorColor: primaryColor,
                        focusNode: _inputFocusNode,
                        showCursor: false,
                        pinTheme: const PinTheme.defaults(
                          activeColor: Colors.transparent,
                          inactiveColor: Colors.black12,
                          selectedColor: Colors.black12,
                        ),
                        animationType: AnimationType.none,
                        keyboardType: TextInputType.number,
                        animationCurve: Curves.linear,
                        textStyle: boldLargeStyle,
                        appContext: context,
                        enablePinAutofill: true,
                        autoFocus: true,
                        length: _maxPinLength,
                        onCompleted: (code) => _onPinSubmitted(context, code),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 32),
                      child: Text(
                        "Um SMS foi enviado para ${widget.phoneNumber}",
                        style: GoogleFonts.roboto().copyWith(
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SaloButton.text(
              title: 'Enviar o código novamente',
              style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
              onPressed: () => _onPhoneValidated(context),
            ),
          ],
        ),
      ),
    );
  }
}
