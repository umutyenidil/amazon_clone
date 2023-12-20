import 'package:amazon_clone/core/extensions/build_context_extensions/build_context_extensions.dart';
import 'package:amazon_clone/product/app_assets/svg_icons.dart';
import 'package:amazon_clone/product/constants/app_border_radius.dart';
import 'package:amazon_clone/product/constants/app_color.dart';
import 'package:amazon_clone/product/constants/app_padding.dart';
import 'package:amazon_clone/product/models/product_model.dart';
import 'package:amazon_clone/product/models/user_model.dart';
import 'package:amazon_clone/product/providers/auth_provider.dart';
import 'package:amazon_clone/product/router/app_router.dart';
import 'package:amazon_clone/product/services/admin_service/admin_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part '_admin_home_page_manager.dart';

part 'widgets/_app_bar.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends _AdminHomePageManager {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: FutureBuilder<AdminServiceResponse>(
        future: AdminService.instance.getAllProducts(xAuthToken: Provider.of<AuthProvider>(context).getCurrentUser()!.token!),
        builder: (BuildContext context, AsyncSnapshot<AdminServiceResponse> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data?.status == AdminServiceResponseStatus.successful) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProductModel model = snapshot.data!.products![index];
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.instance.all16),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Image.network(
                                model.images[0],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(model.name),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: SvgIcons.trash.toWidget(),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingActionButtonAction,
        tooltip: 'Add new product',
        child: SvgIcons.box_add.toWidget(),
      ),
    );
  }
}
