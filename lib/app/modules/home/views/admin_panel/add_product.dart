import 'package:aimart_admin/app/data/data.dart';
import 'package:aimart_admin/app/modules/home/model/product_size_model.dart';
import 'package:aimart_admin/app/modules/home/model/producttag.dart';
import 'package:aimart_admin/app/data/helper/profuct_category.dart';
import 'package:aimart_admin/app/modules/home/widgets/add_image.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_dropdown.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../services/firebase_storage.dart';
import '../../../../services/image_picker_services.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});
  static const String id = '/addproduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productType = TextEditingController();
  final TextEditingController _productdescription = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _discountPrice = TextEditingController();
  ProductCategory selectedProductCategory = ProductCategory.all;
  Tagtype selectedProductTag = Tagtype.bestseller;

  final _items = sizeList
      .map((size) => MultiSelectItem<ProductSize>(size, size.size))
      .toList();
  var _selectedSize = [];
  List<String>? images = [];
  String productImage = '';
  // List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(20.h),
        children: [
          Text('Add Product',
              style: CustomTextStyles.kBold40
                  .copyWith(color: CustomColors.kDarkBlue)),
          SizedBox(height: 20.h),
          SizedBox(
              height: 100.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: [
                  AddImage(
                      onTap: images!.length < 3
                          ? () async {
                              print(images!.length);
                              var imgData =
                                  await ImagePickerServices.getImageAsFile();
                              if (imgData == null) return;

                              productImage = await FirebaseStorageServices
                                  .uploadToStorageAsHTMLFile(
                                      file: imgData,
                                      folderName: "ProductImages");
                              images!.add(productImage);
                              setState(() {});
                            }
                          : () {
                              Get.snackbar('Limit Reached',
                                  'You Can only select upto three images');
                            }),
                  SizedBox(width: 20.w),
                  ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: images?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: CustomColors.kBlack,
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                                image: NetworkImage(images![index]),
                                fit: BoxFit.cover)),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 9.w),
                  )
                ],
              )),
          SizedBox(height: 20.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name",
                    style: CustomTextStyles.kBold16
                        .copyWith(color: CustomColors.kDarkBlue),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                      controller: _productName,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: "Product Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter product name';
                        }
                        return null;
                      })
                ],
              ),
              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Type",
                    style: CustomTextStyles.kBold16
                        .copyWith(color: CustomColors.kDarkBlue),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                      controller: _productName,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: "Product Type",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter product type';
                        }
                        return null;
                      })
                ],
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text("Product Description",
              style: CustomTextStyles.kBold16
                  .copyWith(color: CustomColors.kDarkBlue)),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(right: 495.w),
            child: CustomTextFormField(
                controller: _productdescription,
                isPassword: false,
                maxLines: 4,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                hintText: 'Product Description',
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                }),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              CustomDropDown(
                dropDownList: ProductCategory.values
                    .map((e) => e.toString().split('.').last.capitalizeFirst!)
                    .toList(),
                hintText: 'Select Product Category',
                heading: 'Product Category',
                currentItem: selectedProductCategory
                    .toString()
                    .split('.')
                    .last
                    .capitalizeFirst!
                    .replaceAll("_", " "),
                onchanged: (value) {
                  setState(() {
                    selectedProductCategory = ProductCategory.values.firstWhere(
                        (e) =>
                            e
                                .toString()
                                .split('.')
                                .last
                                .capitalizeFirst!
                                .replaceAll("_", " ") ==
                            value);
                  });
                },
              ),
              SizedBox(width: 20.w),
              CustomDropDown(
                dropDownList: Tagtype.values
                    .map((e) => e.toString().split('.').last.capitalizeFirst!)
                    .toList(),
                hintText: 'Select Product Tag',
                heading: 'Product Tag',
                currentItem: selectedProductTag
                    .toString()
                    .split('.')
                    .last
                    .capitalizeFirst!
                    .replaceAll("_", " "),
                onchanged: (value) {
                  setState(() {
                    selectedProductTag = Tagtype.values.firstWhere((e) =>
                        e
                            .toString()
                            .split('.')
                            .last
                            .capitalizeFirst!
                            .replaceAll("_", " ") ==
                        value);
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Price",
                    style: CustomTextStyles.kBold16
                        .copyWith(color: CustomColors.kDarkBlue),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextFormField(
                      controller: _price,
                      isPassword: false,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: "Product Price",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter product price';
                        }
                        return null;
                      })
                ],
              ),
              SizedBox(width: 20.w),
              selectedProductTag == Tagtype.discount
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Discount Price",
                          style: CustomTextStyles.kBold16
                              .copyWith(color: CustomColors.kDarkBlue),
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                            controller: _discountPrice,
                            isPassword: false,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            hintText: "Product Type",
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter product type';
                              }
                              return null;
                            })
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Container(
                width: 300.w,
                decoration: BoxDecoration(
                  color: CustomColors.kWhite,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: CustomColors.kGrey2),
                ),
                child: Column(
                  children: <Widget>[
                    MultiSelectBottomSheetField(
                      initialChildSize: 0.4,
                      listType: MultiSelectListType.CHIP,
                      searchable: true,
                      buttonIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: CustomColors.kDarkBlue,
                      ),
                      buttonText: Text(
                        "Avaliable Size",
                        style: CustomTextStyles.kBold16
                            .copyWith(color: CustomColors.kDarkBlue),
                      ),
                      title: const Text("Size"),
                      items: _items,
                      onConfirm: (values) {
                        _selectedSize = values;
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (value) {
                          setState(() {
                            _selectedSize.remove(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
