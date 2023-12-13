import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/views/common_widgets/text_input_field.dart';
import 'package:flutter/material.dart';

part '_admin_add_product_page_manager.dart';

part 'widgets/_app_bar.dart';

class AdminAddProductPage extends StatefulWidget {
  const AdminAddProductPage({super.key});

  @override
  State<AdminAddProductPage> createState() => _AdminAddProductPageState();
}

class _AdminAddProductPageState extends _AdminAddProductPageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: AppPadding.instance.h16.add(AppPadding.instance.v32),
            child: Column(
              children: [
                Padding(
                  padding: AppPadding.instance.b16,
                  child: _imageSelectArea(context),
                ),
                Padding(
                  padding: AppPadding.instance.b16,
                  child: TextInputField(
                    controller: _nameController,
                    hintText: 'Product name',
                  ),
                ),
                Padding(
                  padding: AppPadding.instance.b16,
                  child: TextInputField(
                    minLines: 3,
                    controller: _descriptionController,
                    hintText: 'Product description',
                  ),
                ),
                Padding(
                  padding: AppPadding.instance.b16,
                  child: TextInputField(
                    controller: _priceController,
                    hintText: 'Product price',
                  ),
                ),
                Padding(
                  padding: AppPadding.instance.b16,
                  child: TextInputField(
                    inputType: TextInputType.number,
                    controller: _quantityController,
                    hintText: 'Product quantity',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: AppPadding.instance.v16,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppBorderRadius.instance.all16,
                      ),
                      backgroundColor: AppColor.instance.greenVogue,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Add this product',
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: AppColor.instance.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _imageSelectArea(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: ShapeDecoration(
        color: AppColor.instance.cornflower.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.instance.all16,
          side: BorderSide(color: AppColor.instance.greenVogue, width: 0.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: AppPadding.instance.b16,
            child: SvgIcons.image.toWidget(
              height: 64,
              color: AppColor.instance.greenVogue,
            ),
          ),
          Text(
            'Select prouct images',
            style: context.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
