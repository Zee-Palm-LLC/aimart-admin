import 'package:aimart_admin/app/data/data.dart';
import 'package:aimart_admin/app/modules/home/controllers/auth_controller.dart';
import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/add_product.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/dash_borad_screen.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/delete_product.dart';
import 'package:aimart_admin/app/modules/home/views/admin_panel/update_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WebViewMain extends StatefulWidget {
  static const String id = "/Dashboard";
  @override
  State<WebViewMain> createState() => _WebViewMainState();
}

class _WebViewMainState extends State<WebViewMain> {
  Widget selectedSCreen = DashBoardScreen();

  chooseScreens(item) {
    switch (item.route) {
      case DashBoardScreen.id:
        setState(() {
          selectedSCreen = DashBoardScreen();
        });
        break;
      case AddProduct.id:
        setState(() {
          selectedSCreen = AddProduct();
        });
        break;
      case UpdateProduct.id:
        setState(() {
          selectedSCreen = UpdateProduct(product: products[0],);
        });
        break;
      case DeleteProduct.id:
        setState(() {
          selectedSCreen = DeleteProduct();
        });
        break;
      default:
    }
  }

  AuthController ac = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
        appBar: AppBar(
          title: Text('Aimart',
              style: CustomTextStyles.kBold20
                  .copyWith(color: CustomColors.kDarkBlue)),
          actions: [
            IconButton(
                onPressed: () {
                  ac.signOut();
                },
                icon: Icon(
                  Icons.logout,
                  color: CustomColors.kDarkBlue,
                )),
            SizedBox(width: 30.w),
          ],
        ),
        sideBar: SideBar(
          items: const [
            AdminMenuItem(
              title: 'Dashboard',
              route: '/dashboard',
              icon: Icons.dashboard,
            ),
            AdminMenuItem(
              title: 'Add Product',
              route: AddProduct.id,
              icon: Icons.add,
            ),
            AdminMenuItem(
              title: 'Update Product',
              route: UpdateProduct.id,
              icon: Icons.update,
            ),
            AdminMenuItem(
              title: 'Delete Product',
              icon: Icons.delete_forever,
              route: DeleteProduct.id,
            ),
          ],
          selectedRoute: WebViewMain.id,
          onSelected: (item) {
            chooseScreens(item);
          },
        ),
        body: selectedSCreen);
  }
}
