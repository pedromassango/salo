import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salo/src/services/main/home/home_page_cubit.dart';
import 'package:salo/src/shared/entities/category.dart';

import '../../../shared/resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _onSubcategorySelected(Category category) {}

  @override
  void initState() {
    super.initState();
    context.read<HomePageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 26),
            decoration: const BoxDecoration(color: primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Qual é o serviço que você procura?',
                  style: context.textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Lavadeira, confeitaria, etc.',
                    hintStyle: context.textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    labelStyle: context.textTheme.titleMedium!.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black12,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: accentColorAlternative,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        width: 1.5,
                        color: Colors.black12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<HomePageCubit, HomePageCubitState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ...state.categories.map((category) {
                        return _CategorySection(
                          category: category,
                          key: ObjectKey(category),
                          onSubcategorySelected: _onSubcategorySelected,
                        );
                      }),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _CategorySection extends StatelessWidget {
  const _CategorySection({
    super.key,
    required this.category,
    required this.onSubcategorySelected,
  });

  final Category category;
  final ValueChanged<Category> onSubcategorySelected;

  final radius = 12.0;
  final cardSize = 230.0;

  @override
  Widget build(BuildContext context) {
    final subcategories = category.subcategoriesByPriority;
    if (subcategories.isEmpty) {
      return const SizedBox.shrink();
    }

    final placeholderImage = Container(
      width: double.maxFinite,
      height: cardSize * .62,
      decoration: BoxDecoration(
        color: dividerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
          child: Text(
            category.title,
            style: context.textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: cardSize,
          child: ListView.builder(
            itemCount: subcategories.length,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = subcategories.elementAt(index);
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () => onSubcategorySelected(item),
                  child: Container(
                    width: 180,
                    height: cardSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      border: Border.all(color: dividerColor),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radius),
                            topRight: Radius.circular(radius),
                          ),
                          child: CachedNetworkImage(
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: cardSize * .62,
                            imageUrl:
                                item.imageUrl ?? 'https://invalid.url.png',
                            placeholder: (_, __) => placeholderImage,
                            errorWidget: (_, __, ___) => placeholderImage,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                            child: Center(
                              widthFactor: 1,
                              child: Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
