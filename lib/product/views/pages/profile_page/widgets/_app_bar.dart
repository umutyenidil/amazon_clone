part of '../profile_page.dart';

class _AppBar extends StatefulWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  State<_AppBar> createState() => _AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _AppBarState extends State<_AppBar> with TickerProviderStateMixin {
  late bool _isSearchBarOpened;

  late AnimationController _animation1Controller;
  late Animation<Color?> _animation1A;
  late Animation<Color?> _animation1B;

  late AnimationController _animation2Controller;
  late Animation<double> _animation2;

  late AnimationController _animation3Controller;
  late Animation<int> _animation3;
  late final String hintText;

  @override
  void initState() {
    super.initState();
    _isSearchBarOpened = false;

    // 1. animasyon
    _animation1Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation1A = ColorTween(begin: AppColor.instance.greenVogue, end: AppColor.instance.white).animate(CurvedAnimation(parent: _animation1Controller, curve: Curves.easeIn));
    _animation1B = ColorTween(begin: AppColor.instance.white, end: AppColor.instance.greenVogue).animate(CurvedAnimation(parent: _animation1Controller, curve: Curves.easeIn));
    _animation1Controller.addListener(() {
      setState(() {});
    });
    _animation1Controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animation2Controller.forward();
      }
    });

    // 2. animasyon
    _animation2Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation2 = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: _animation2Controller, curve: Curves.easeIn));
    _animation2Controller.addListener(() {
      setState(() {});
    });
    _animation2Controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animation3Controller.forward();
      }
    });

    hintText = 'Ne aramak istersiniz ?';
    _animation3Controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation3 = IntTween(begin: 0, end: hintText.length).animate(CurvedAnimation(parent: _animation3Controller, curve: Curves.easeIn));
    _animation3Controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.statusBarHeight).add(AppPadding.instance.h16),
      color: AppColor.instance.greenVogue,
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 8,
              bottom: 8,
              right: SvgIconSizes.l.toDouble() + 12,
              left: (context.screenWidth - 2 * SvgIconSizes.l.toDouble() - 28 - 16 - 8 - 8) * _animation2.value,
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.instance.all16),
                  color: _animation1A.value,
                ),
                child: SvgIcons.placeholder.toWidget(),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: AppPadding.instance.h8,
                  child: SvgIcons.amazon.toWidget(),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hintText.substring(0, _animation3.value.toInt()),
                    ),
                  ),
                ),
                Padding(
                  padding: AppPadding.instance.h4,
                  child: GestureDetector(
                    onTap: () {
                      if (!_isSearchBarOpened) {
                        _animation1Controller.forward();
                      }
                    },
                    child: SvgIcons.search_normal_1.toWidget(
                      color: _animation1B.value,
                    ),
                  ),
                ),
                Padding(
                  padding: AppPadding.instance.l16,
                  child: SvgIcons.notification.toWidget(
                    color: AppColor.instance.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animation1Controller.dispose();
    _animation2Controller.dispose();
    _animation3Controller.dispose();

    super.dispose();
  }
}
