import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salo/src/get_categories_usecase.dart';
import 'package:salo/src/professionals/category_selector/category_selector_dialog_cubit.dart';
import 'package:salo/src/shared/resources.dart';

class CategorySelectorDialog extends StatelessWidget {
  CategorySelectorDialog({
    super.key,
  });

  final _bloc = CategorySelectorDialogCubit(
    getCategoriesUsecase: GetCategoriesUsecase(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategorySelectorDialogCubit,
        CategorySelectorDialogCubitState>(
      listener: (context, state) {
        if (state.saved) {
          context.pop(true);
        }
      },
      bloc: _bloc..init(),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close),
            ),
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
          ),
          bottomNavigationBar: SafeArea(
            minimum: const EdgeInsets.only(left: 12, right: 12),
            child: SaloButton.primary(
              onPressed: state.canSave ? _bloc.onSave : null,
              loading: state.isLoading || state.isSaving,
              title: 'Guardar',
            ),
          ),
          body: state.hasError
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Text('Algo de errado aconteceu, tente novamente!'),
                  ),
                )
              : state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Escolha até três categorias de serviços que você realiza'
                                .toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: primaryColor,
                                ),
                          ),
                        ),
                        Expanded(
                          child: state.selectedMainCategory == null
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.categories.length,
                                  padding: const EdgeInsets.all(16),
                                  itemBuilder: (context, index) {
                                    final item = state.categories[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black26),
                                      ),
                                      child: ListTile(
                                        onTap: state.isLoading || state.isSaving
                                            ? null
                                            : () => _bloc
                                                .onMainCategoryChanged(item),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                16, 8, 16, 12),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            item.title,
                                            style: context.textTheme.titleLarge,
                                          ),
                                        ),
                                        subtitle: Text(
                                          item.message ?? '',
                                          style: context.textTheme.titleMedium!
                                              .copyWith(
                                            color: Colors.black.withOpacity(.6),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(16),
                                  clipBehavior: Clip.hardEdge,
                                  itemCount: state.subcategories.length,
                                  itemBuilder: (context, index) {
                                    final item =
                                        state.subcategories.elementAt(index);
                                    final checked =
                                        state.isSubcategorySelected(item);
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border:
                                            Border.all(color: Colors.black26),
                                      ),
                                      child: ListTile(
                                        onTap: state.isLoading || state.isSaving
                                            ? null
                                            : () => _bloc
                                                .onSubcategoriesChanged(item),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                16, 8, 16, 12),
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8),
                                          child: Text(
                                            item.title,
                                            style: context.textTheme.titleLarge,
                                          ),
                                        ),
                                        trailing: Checkbox(
                                          value: checked,
                                          fillColor:
                                              WidgetStateProperty.resolveWith(
                                                  (states) {
                                            return states.contains(
                                                    WidgetState.selected)
                                                ? primaryColor
                                                : null;
                                          }),
                                          checkColor: accentColor,
                                          side: const BorderSide(width: 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          onChanged: (v) => _bloc
                                              .onSubcategoriesChanged(item),
                                        ),
                                        subtitle: Text(
                                          item.message ?? '',
                                          style: context.textTheme.titleMedium!
                                              .copyWith(
                                            color: Colors.black.withOpacity(.6),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ),
                      ],
                    ),
        );
      },
    );
  }
}
