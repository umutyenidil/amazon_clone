part of 'file_image_page_view.dart';

abstract class _FileImagePageViewManager extends State<FileImagePageView> {
  late final double _width;
  late final double _height;
  late List<File> _images;
  late final _itemPadding;

  @override
  void initState() {
    super.initState();

    _width = widget.width;
    _height = widget.height;
    _images = widget.images;
    _itemPadding = widget.itemPadding;
  }
}
