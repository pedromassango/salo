import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/gen/assets.gen.dart';
import '../../shared/resources.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.coverrrrrr.image(fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 0,
            left: 16,
            right: 16,
            child: SafeArea(
              minimum: const EdgeInsets.only(bottom: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      appName,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 100,
                            fontWeight: FontWeight.w900,
                            color: accentColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Text(
                      "Seja seu próprio boss. Venda seus serviços para milhar de clientes e ganhe mais dinheiro!",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: const Color(0xff798B81),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 56, 16, 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: SaloButton.primary(
                        title: 'Prestar meus serviços',
                        backgroundColor: accentColor,
                        onPressed: () => context.push('/auth'),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'OU, PROCURE UM PROFISSIONAL'.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
