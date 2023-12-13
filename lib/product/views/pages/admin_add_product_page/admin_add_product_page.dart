import 'dart:io';

import 'package:amazon_clone/product/services/auth_service/auth_service.dart';
import 'package:amazon_clone/product/utilities/snack_bar_helper.dart';
import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/add_product_form_model.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/services/admin_service/admin_service.dart';
import 'package:amazon_clone/product/views/common_widgets/file_image_page_view/file_image_page_view.dart';
import 'package:amazon_clone/product/views/common_widgets/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

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
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: [
                Padding(
                  padding: AppPadding.instance.b16,
                  child: (_images.isEmpty)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: _imageSelectArea(context),
                        )
                      : FileImagePageView(
                          width: double.infinity,
                          height: 200,
                          images: _images,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 16),
                          onDelete: (int deletedItemIndex) {
                            setState(() {
                              _images.removeAt(deletedItemIndex);
                            });
                          },
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Padding(
                        padding: AppPadding.instance.b16,
                        child: TextInputField(
                          controller: _nameController,
                          hintText: 'Product name',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Bos birakilamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: AppPadding.instance.b16,
                        child: TextInputField(
                          minLines: 3,
                          controller: _descriptionController,
                          hintText: 'Product description',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Bos birakilamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: AppPadding.instance.b16,
                        child: TextInputField(
                          inputType: TextInputType.number,
                          controller: _priceController,
                          hintText: 'Product price',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Bos birakilamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: AppPadding.instance.b16,
                        child: TextInputField(
                          inputType: TextInputType.number,
                          controller: _quantityController,
                          hintText: 'Product quantity',
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Bos birakilamaz';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: AppPadding.instance.b16,
                        child: SizedBox(
                          width: double.infinity,
                          child: DropdownButton<String>(
                            value: _categoryId,
                            items: [
                              ..._categories.map((category) {
                                return DropdownMenuItem(
                                  value: category['uuid'],
                                  child: Text(category['name']!),
                                );
                              }).toList(),
                            ],
                            onChanged: (String? categoryId) {
                              setState(() {
                                _categoryId = categoryId!;
                              });
                            },
                          ),
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
                          onPressed: _onSubmitForm,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imageSelectArea(BuildContext context) {
    return GestureDetector(
      onTap: _onSelectImages,
      child: Container(
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
      ),
    );
  }
}
