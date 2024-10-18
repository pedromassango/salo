import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salo/src/professionals/profile/profile_screen_cubit.dart';
import 'package:salo/src/professionals/profile/settings_section.dart';

import '../../shared/resources.dart';
import '../category_selector/category_selector_dialog.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final forwardIcon = Icon(
    Icons.arrow_forward_ios_rounded,
    size: 16,
    color: dividerColor,
  );

  void _showCategoryPicker(
    BuildContext context,
    ProfileScreenCubitState state,
  ) {
    unawaited(showModalBottomSheet<bool?>(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: CategorySelectorDialog(),
        );
      },
    ).then((updated) {
      if (context.mounted && (updated == true)) {
        context.read<ProfileScreenCubit>().init();
      }
    }));
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileScreenCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final mediumStyle = textTheme.titleMedium!;
    final dividerWidget = Divider(height: 1, color: dividerColor);

    return BlocConsumer<ProfileScreenCubit, ProfileScreenCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: const Text('Meu Perfil'),
          ),
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.account_circle,
                                  color: Colors.black12,
                                  size: 100,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Editar foto',
                                  style: textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: accentColorAlternative,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.user?.fullName ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.titleLarge,
                                  ),
                                  Text(
                                    maxLines: 1,
                                    state.phoneNumber,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.titleMedium,
                                  ),
                                  Text(
                                    state.user?.fullAddress ?? '',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(top: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text: '${state.user?.servicesCount ?? 0}\n',
                                  style: textTheme.titleLarge,
                                  children: [
                                    TextSpan(
                                      text: 'Serviços',
                                      style: textTheme.titleMedium,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  text:
                                      '${state.user?.rating.toStringAsFixed(1) ?? 0}\n',
                                  style: textTheme.titleLarge,
                                  children: [
                                    TextSpan(
                                      text: 'Avaliação',
                                      style: textTheme.titleMedium,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Column(
                        children: [
                          dividerWidget,
                          ListTile(
                            splashColor: Colors.transparent,
                            contentPadding: EdgeInsets.zero,
                            textColor: primaryColor,
                            onTap: () => _showCategoryPicker(context, state),
                            title: Text(
                              'Editar minha categoria',
                              maxLines: 1,
                              style: mediumStyle.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle:
                                (state.user?.categoryTitle.isNotEmpty ?? false)
                                    ? Text(
                                        state.user?.categoryTitle ?? '',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      )
                                    : null,
                            trailing: forwardIcon,
                          ),
                          dividerWidget,
                        ],
                      ),
                      const SettingsSection(),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
