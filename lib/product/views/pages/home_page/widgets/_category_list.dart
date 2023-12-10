part of '../home_page.dart';

class _CategoryList extends StatefulWidget {
  const _CategoryList({super.key});

  @override
  State<_CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends _CategoryListManager {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppPadding.instance.h16,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._categories.mapIndexed((index, element) {
            return Padding(
              padding: (index != _categories.length - 1) ? AppPadding.instance.r32 : EdgeInsets.zero,
              child: _categoryCard(context: context, text: element),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _categoryCard({
    required BuildContext context,
    required String text,
    VoidCallback? onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColor.instance.greenVogue,
              width: 3.0,
            ),
          ),
        ),
        child: Padding(
          padding: AppPadding.instance.b4.add(AppPadding.instance.r8),
          child: Text(
            text,
            style: context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}

abstract class _CategoryListManager extends State<_CategoryList> {
  late List<String> _categories;

  @override
  void initState() {
    super.initState();

    _categories = [
      'Electronics',
      'Essentials',
      'Appliances',
      'Books',
      'Fashion',
    ];
  }
}
