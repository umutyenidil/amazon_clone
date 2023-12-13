part of '../admin_home_page.dart';

class _AppBar extends StatefulWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarState extends _AppBarManager {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.instance.greenVogue,
      title: Text(
        _titleText,
        style: context.textTheme.titleLarge!.copyWith(
          color: AppColor.instance.white,
        ),
      ),
      leading: IconButton(
        icon: SvgIcons.amazon.toWidget(),
        onPressed: () {
          AppRouter.of(context).route(
            Routes.admin_main_page,
            routingMethod: RoutingMethods.pushReplacement,
          );
        },
      ),
    );
  }
}

abstract class _AppBarManager extends State<_AppBar> with TickerProviderStateMixin {
  late final String _titleText;

  @override
  void initState() {
    super.initState();

    final UserModel user = Provider.of<AuthProvider>(context, listen: false).getCurrentUser()!;
    _titleText = 'Hello ${user.name.split(' ')[0]}';
  }
}
