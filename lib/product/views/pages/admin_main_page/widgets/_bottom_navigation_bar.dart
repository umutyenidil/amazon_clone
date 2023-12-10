part of '../admin_main_page.dart';

typedef PageChangeCallback = void Function(int pageIndex);

class _BottomNavigationBar extends StatefulWidget {
  final List<Routes> pages;
  final PageChangeCallback pageChangeCallback;

  const _BottomNavigationBar({required this.pages, required this.pageChangeCallback});

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends _BottomNavigationBarManager {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        color: AppColor.instance.greenVogue,
        padding: AppPadding.instance.h32.add(AppPadding.instance.v4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(_pages.length, (index) {
                  return Visibility(
                    visible: index == _currentPageIndex,
                    child: Container(
                      width: SvgIconSizes.xl.toDouble(),
                      height: 4,
                      color: AppColor.instance.easternBlue,
                    ),
                  );
                }).toList(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomNavigationBarItem(
                  icon: SvgIcons.home_2,
                  route: _pages[0],
                ),
                _bottomNavigationBarItem(
                  route: _pages[1],
                  icon: SvgIcons.chart_21,
                ),
                _bottomNavigationBarItem(
                  route: _pages[2],
                  icon: SvgIcons.box,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBarItem({
    required Routes route,
    required SvgIcons icon,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentPageIndex = _pages.indexOf(route);
          widget.pageChangeCallback(_currentPageIndex);
        });
      },
      child: icon.toWidget(
        color: _currentPageIndex == _pages.indexOf(route) ? AppColor.instance.easternBlue : AppColor.instance.cornflower,
        size: SvgIconSizes.xl,
      ),
    );
  }
}

abstract class _BottomNavigationBarManager extends State<_BottomNavigationBar> {
  late final List<Routes> _pages;
  late int _currentPageIndex;

  @override
  void initState() {
    super.initState();

    _pages = widget.pages;
    _currentPageIndex = 0;
  }
}
