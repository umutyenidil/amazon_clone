part of '../admin_add_product_page.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.instance.greenVogue,
      title: Text(
        'Add Product',
        style: context.textTheme.titleLarge!.copyWith(
          color: AppColor.instance.white,
        ),
      ),
      leading: IconButton(
        icon: SvgIcons.arrow_square_left.toWidget(
          color: AppColor.instance.white,
        ),
        onPressed: () {
          AppRouter.of(context).route(
            Routes.admin_main_page,
            routingMethod: RoutingMethods.pushReplacement,
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
