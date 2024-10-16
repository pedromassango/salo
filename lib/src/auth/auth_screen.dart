import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salo/src/auth/auth_screen_cubit.dart';
import 'package:salo/src/auth/domain/send_otp_usecase.dart';

import '../shared/resources.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    context.read<AuthScreenCubit>().init();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // For the back button
      appBar: AppBar(backgroundColor: Colors.white),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _PhoneInputForm(
              onNext: () => _pageController.nextPage(
                duration: const Duration(milliseconds: 270),
                curve: Curves.linear,
              ),
            ),
            const _OtpValidationForm(),
          ],
        ),
      ),
    );
  }
}

class _PhoneInputForm extends StatelessWidget {
  const _PhoneInputForm({required this.onNext});

  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthScreenCubit, AuthScreenCubitState>(
      listenWhen: (_, next) => next.isOtpCodeSent,
      listener: (_, state) {
        if (state.isOtpCodeSent) {
          onNext.call();
        }
      },
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
                        child: BlocBuilder<AuthScreenCubit,
                                AuthScreenCubitState>(
                            buildWhen: (p, n) => p.countryCode != n.countryCode,
                            builder: (context, state) {
                              return TextField(
                                controller: TextEditingController(
                                  text: state.countryCode,
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
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                          ),
                          child: BlocBuilder<AuthScreenCubit,
                              AuthScreenCubitState>(
                            builder: (context, state) {
                              return TextFormField(
                                initialValue: state.phoneNumber,
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
                                onChanged: context
                                    .read<AuthScreenCubit>()
                                    .onPhoneNumberChanged,
                                decoration: InputDecoration(
                                  hintText: "Número de telefone",
                                  hintStyle:
                                      context.textTheme.titleMedium!.copyWith(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                ),
                              );
                            },
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
          BlocBuilder<AuthScreenCubit, AuthScreenCubitState>(
            buildWhen: (p, n) =>
                p.isPhoneNumberValid != n.isPhoneNumberValid ||
                p.isLoading != n.isLoading,
            builder: (context, state) {
              return SaloButton.primary(
                height: 56,
                title: 'Confirmar',
                loading: state.isLoading,
                onPressed: state.isPhoneNumberValid
                    ? context.read<AuthScreenCubit>().onSendOtp
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _OtpValidationForm extends StatefulWidget {
  const _OtpValidationForm();

  @override
  State<_OtpValidationForm> createState() => _OtpValidationFormState();
}

class _OtpValidationFormState extends State<_OtpValidationForm> {
  final _inputFocusNode = FocusNode();
  final _maxPinLength = 6;

  @override
  void initState() {
    super.initState();
    FocusManager.instance.primaryFocus?.requestFocus(_inputFocusNode);
  }

  @override
  void dispose() {
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final boldLargeStyle = context.textTheme.displayLarge!.copyWith(
      fontSize: 50,
      fontWeight: FontWeight.w900,
    );

    return BlocListener<AuthScreenCubit, AuthScreenCubitState>(
      listenWhen: (a, b) => a.authState != b.authState,
      listener: (context, state) {
        switch (state.authState) {
          case AuthVerificationState.none:
            // Do nothing.
            break;
          case AuthVerificationState.error:
          case AuthVerificationState.errorInvalidOtp:
            // TODO: Show error.
            break;
          case AuthVerificationState.accountIncomplete:
            context.go('/signup');
            break;
          case AuthVerificationState.loggedIn:
            context.go('/home');
            break;
        }
      },
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
                      onChanged: context.read<AuthScreenCubit>().onOtpChanged,
                      onCompleted:
                          context.read<AuthScreenCubit>().onOtpSubmitted,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: BlocBuilder<AuthScreenCubit, AuthScreenCubitState>(
                      builder: (context, state) {
                        final errorMessage = state.authState ==
                                AuthVerificationState.errorInvalidOtp
                            ? "Este código não é válido!"
                            : state.authState == AuthVerificationState.error
                                ? 'Algo de errado aconteceu, tente novamente!'
                                : null;

                        return state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : Text(
                                errorMessage ??
                                    "Um SMS foi enviado para ${state.effectivePhoneNumber}",
                                style: GoogleFonts.roboto().copyWith(
                                  color: errorMessage != null
                                      ? Colors.red
                                      : Colors.black54,
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SaloButton.text(
            title: 'Enviar o código novamente',
            style: context.textTheme.titleLarge!.copyWith(fontSize: 16),
            onPressed: context.read<AuthScreenCubit>().onSendOtpAgain,
          ),
        ],
      ),
    );
  }
}
