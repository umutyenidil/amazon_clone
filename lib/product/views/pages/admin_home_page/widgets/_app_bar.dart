part of '../admin_home_page.dart';

class _AppBar extends StatefulWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64);
}

class _AppBarState extends _AppBarManager {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.statusBarHeight),
      color: AppColor.instance.greenVogue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: AppPadding.instance.h16,
            child: Row(
              children: [
                Padding(
                  padding: AppPadding.instance.r32,
                  child: SvgIcons.amazon.toWidget(),
                ),
                Expanded(
                  child: Text(
                    _titleText,
                    maxLines: 1,
                    style: context.textTheme.titleLarge!.copyWith(
                      color: AppColor.instance.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
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
