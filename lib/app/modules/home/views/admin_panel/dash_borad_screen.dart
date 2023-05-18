import 'package:aimart_admin/app/data/data.dart';
import 'package:aimart_admin/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/add_product.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/update_product.dart';
import 'package:aimart_admin/app/modules/home/views/widgets/grid_view.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});
  static const String id = '/dashboard';
  ProductController pc = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Dashboard',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'All Product',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(() {
              return pc.products.isEmpty
                  ? Center(
                      child: Text("No Products"),
                    )
                  : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      runSpacing: 10.w,
                      
                      spacing: 10.w,
                      children: List.generate(
                          pc.products.length,
                          (index) => InkWell(
                                onTap: () {
                                  Get.to(() => UpdateProduct(
                                        product: pc.products[index],
                                      ));
                                },
                                child: ItemInGridSale(
                                  product: pc.products[index],
                                  onPressed: () {
                                    Get.dialog(AlertDialog(
                                      title: const Text(
                                        'Are You Sure You want to delete?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 32,
                                        ),
                                      ),
                                      actions: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            PrimaryAppButton(
                                              width: 100,
                                              backgroundColor:
                                                  CustomColors.kdarkred,
                                              child: Text('Delete',
                                                  style: CustomTextStyles
                                                      .kBold16
                                                      .copyWith(
                                                          color: CustomColors
                                                              .kWhite)),
                                              onTap: () {
                                                pc.deleteProduct(
                                                    product:
                                                        pc.products[index]);
                                                Get.back();
                                              },
                                            ),
                                            SizedBox(
                                              width: 14.w,
                                            ),
                                            PrimaryAppButton(
                                              width: 100,
                                              backgroundColor:
                                                  CustomColors.kPrimary,
                                              child: Text('Cancel',
                                                  style: CustomTextStyles
                                                      .kBold16
                                                      .copyWith(
                                                          color: CustomColors
                                                              .kWhite)),
                                              onTap: () {
                                                Get.back();
                                              },
                                            ),
                                          ],
                                        )
                                      ],
                                    ));
                                  },
                                  isFavourite: Colors.red,
                                ),
                              )),
                    ),
                  );
            })
          ],
        ),
      ),
    );
  }
}
