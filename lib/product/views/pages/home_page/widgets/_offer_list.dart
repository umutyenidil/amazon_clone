part of '../home_page.dart';

class _OfferList extends StatefulWidget {
  const _OfferList({super.key});

  @override
  State<_OfferList> createState() => _OfferListState();
}

class _OfferListState extends _OfferListManager {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppPadding.instance.b8,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Offers',
              style: context.textTheme.titleMedium!.copyWith(
                color: AppColor.instance.greenVogue,
              ),
            ),
          ),
        ),
        ..._offers.mapIndexed((index, element) {
          return Padding(
            padding: (index != _offers.length - 1) ? AppPadding.instance.b16 : EdgeInsets.zero,
            child: _offerCard(context: context, offer: element),
          );
        }).toList(),
      ],
    );
  }

  Widget _offerCard({
    required BuildContext context,
    required Map<String, dynamic> offer,
  }) {
    return Card(
      color: AppColor.instance.cornflower,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.instance.all16,
      ),
      child: Padding(
        padding: AppPadding.instance.all16,
        child: Column(
          children: [
            Padding(
              padding: AppPadding.instance.b16,
              child: const SizedBox(
                width: double.infinity,
                height: 200,
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: AppPadding.instance.b8,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  offer['name'],
                  style: context.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                offer['price'],
                style: context.textTheme.titleLarge!.copyWith(
                    // fontWeight: FontWeight.w400,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

abstract class _OfferListManager extends State<_OfferList> {
  late final List<Map<String, dynamic>> _offers;

  @override
  void initState() {
    super.initState();

    _offers = [
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'name': 'Macbook M1',
        'price': '999\$',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'name': 'Macbook M2',
        'price': '1299\$',
      },
      {
        'imageUrl': 'https://picsum.photos/200/300',
        'name': 'Macbook M2 Pro',
        'price': '1599\$',
      }
    ];
  }
}
