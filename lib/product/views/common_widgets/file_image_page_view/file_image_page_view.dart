import 'dart:io';

import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:flutter/material.dart';

part '_file_image_page_view_manager.dart';

typedef VoidCallbackInt = void Function(int deletedItemIndex);

class FileImagePageView extends StatefulWidget {
  final double width;
  final double height;
  final List<File> images;
  final VoidCallbackInt onDelete;
  final EdgeInsetsGeometry itemPadding;

  const FileImagePageView({
    super.key,
    required this.width,
    required this.height,
    required this.images,
    required this.onDelete,
    this.itemPadding = EdgeInsets.zero,
  });

  @override
  State<FileImagePageView> createState() => _FileImagePageViewState();
}

class _FileImagePageViewState extends _FileImagePageViewManager {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
      height: _height,
      child: PageView.builder(
        itemCount: _images.length,
        itemBuilder: (context, index) {
          File currentImage = _images[index];
          return Padding(
            padding: _itemPadding,
            child: _imageBox(
              currentImage: currentImage,
              onDelete: () {
                setState(() {
                  _images.removeAt(index);
                });
                widget.onDelete(index);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _imageBox({
    required File currentImage,
    required VoidCallback onDelete,
  }) {
    return Stack(
      children: [
        SizedBox(
          width: _width,
          height: _height,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: AppBorderRadius.instance.all16,
                side: BorderSide(
                  color: AppColor.instance.greenVogue,
                  width: 0.2,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: AppBorderRadius.instance.all16,
              child: Image.file(
                currentImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: const CircleBorder(),
              color: Colors.grey.withOpacity(0.25),
            ),
            child: IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
