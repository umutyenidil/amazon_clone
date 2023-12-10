part of '../home_page.dart';

class _AppBar extends StatefulWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64 + 1 + 40);
}

class _AppBarState extends _AppBarManager {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.statusBarHeight),
      color: AppColor.instance.greenVogue,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppPadding.instance.h16,
            child: Row(
              children: [
                SvgIcons.amazon.toWidget(),
                Expanded(
                  child: Padding(
                    padding: AppPadding.instance.h16.add(AppPadding.instance.v8),
                    child: TextField(
                      style: TextStyle(color: AppColor.instance.greenVogue),
                      decoration: InputDecoration(
                        contentPadding: AppPadding.instance.h16,
                        border: OutlineInputBorder(
                          borderRadius: AppBorderRadius.instance.all16,
                          borderSide: BorderSide.none,
                        ),
                        hintText: _hintText,
                        fillColor: AppColor.instance.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                SvgIcons.search_normal_1.toWidget(
                  color: AppColor.instance.white,
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
            color: AppColor.instance.white,
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: Padding(
              padding: AppPadding.instance.h16,
              child: Row(
                children: [
                  SvgIcons.location.toWidget(
                    color: AppColor.instance.white,
                    size: SvgIconSizes.s,
                  ),
                  Expanded(
                    child: Padding(
                      padding: AppPadding.instance.h16,
                      child: _addressText == null
                          ? CircularProgressIndicator()
                          : Text(
                              _addressText,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.bodyMedium!.copyWith(
                                color: AppColor.instance.white,
                              ),
                            ),
                    ),
                  ),
                  SvgIcons.arrow_square_down.toWidget(
                    color: AppColor.instance.white,
                    size: SvgIconSizes.s,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

abstract class _AppBarManager extends State<_AppBar> with TickerProviderStateMixin {
  late final String _hintText;
  late final String _addressText;

  @override
  void initState() {
    super.initState();

    _hintText = 'Ne aramak istersiniz?';
    final UserModel user = Provider.of<AuthProvider>(context, listen: false).getCurrentUser()!;
    _addressText = 'Delivery to ${user.name} - ${user.address}';
  }
}
