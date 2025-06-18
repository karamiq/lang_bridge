import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';

class SearchTextField<DataType> extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.searchController,
    this.onChange,
  });

  final TextEditingController searchController;
  final void Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            searchController.clear();
          },
        ),
        hintText: context.l10n.search,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(Insets.small),
          child: SvgPicture.asset(Assets.assetsSvgSearch01, color: context.colorScheme.onSurfaceVariant),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceVariant,
      ),
      controller: searchController,
      onChanged: onChange,
    );
  }
}
