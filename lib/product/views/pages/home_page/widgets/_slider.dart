part of '../home_page.dart';

class _Slider extends StatefulWidget {
  const _Slider({super.key});

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends _SliderManager {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
        controller: _sliderController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: AppPadding.instance.h32,
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.instance.all16),
              ),
              child: Placeholder(
                child: Center(
                  child: Text(
                    (index % _imageUrls.length).toString(),
                    style: context.textTheme.displayMedium!.copyWith(
                      color: AppColor.instance.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

abstract class _SliderManager extends State<_Slider> with SingleTickerProviderStateMixin {
  late final List<String> _imageUrls;
  late final PageController _sliderController;
  late final Timer _sliderAnimation;

  @override
  void initState() {
    super.initState();

    _imageUrls = [
      'https://picsum.photos/200/300',
      'https://picsum.photos/200/300',
    ];

    _sliderController = PageController();

    _sliderAnimation = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        _sliderController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    _sliderController.dispose();
    _sliderAnimation.cancel();

    super.dispose();
  }
}
