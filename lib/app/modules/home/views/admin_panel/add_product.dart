import 'package:aimart_admin/app/data/data.dart';
import 'package:aimart_admin/app/data/helper/product_category.dart';
import 'package:aimart_admin/app/modules/home/controllers/product_controller.dart';
import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:aimart_admin/app/modules/home/widgets/add_image.dart';
import 'package:aimart_admin/app/modules/home/widgets/color_card.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_button.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_dropdown.dart';
import 'package:aimart_admin/app/modules/home/widgets/custom_textfield.dart';
import 'package:aimart_admin/app/modules/home/widgets/size_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
  ProductController pc = Get.find<ProductController>();
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productType = TextEditingController();
  final TextEditingController _productdescription = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _discountPrice = TextEditingController();
  ProductCategory selectedProductCategory = ProductCategory.all;
  Tagtype selectedProductTag = Tagtype.bestseller;

  List<String>? images = [];
  String productImage = '';
  List<String> selectedSize = [];
  List<String> selectedColor = [];
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
                              print(images);
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
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              image: DecorationImage(
                                  image: NetworkImage(images![index]),
                                  fit: BoxFit.cover)),
                          child: IconButton(
                              constraints: const BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                
                                images!.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: CustomColors.kBlack,
                              )));
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
                      controller: _productType,
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
          Text(
            "Avaliable Size",
            style: CustomTextStyles.kBold16
                .copyWith(color: CustomColors.kDarkBlue),
          ),
          SizedBox(height: 10.h),
          Container(
              height: 50.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductSizeCard(
                        onTap: () {
                          selectedSize.contains(sizeList[index])
                              ? selectedSize.remove(sizeList[index])
                              : selectedSize.add(sizeList[index]);
                          setState(() {});
                          print(selectedSize);
                        },
                        cardColor: selectedSize.contains(sizeList[index])
                            ? CustomColors.kPrimary
                            : CustomColors.kWhite,
                        text: sizeList[index],
                        textColor: selectedSize.contains(sizeList[index])
                            ? CustomColors.kWhite
                            : CustomColors.kDarkBlue);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount: sizeList.length)),
          SizedBox(height: 20.h),
          Text(
            "Avaliable Colors",
            style: CustomTextStyles.kBold16
                .copyWith(color: CustomColors.kDarkBlue),
          ),
          SizedBox(height: 10.h),
          Container(
              height: 50.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductColorCard(
                        onTap: () {
                          selectedColor.contains(color[index])
                              ? selectedColor.remove(color[index])
                              : selectedColor.add(color[index]);
                          setState(() {});
                        },
                        cardColor: Color(int.parse(color[index])),
                        child: selectedColor.contains(color[index])
                            ? Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                    color: CustomColors.kWhite,
                                    shape: BoxShape.circle),
                                child: Icon(Icons.done,
                                    color: CustomColors.kDarkBlue))
                            : const SizedBox());
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10.w),
                  itemCount: sizeList.length)),
          SizedBox(height: 20.h),
          PrimaryAppButton(
              width: 300.w,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  pc.addProduct(
                      product: Product(
                          productId: '',
                          productName: _productName.text,
                          productType: _productType.text,
                          productPrice: double.parse(_price.text),
                          oldPrice: double.parse(_discountPrice.text),
                          productCategory: selectedProductCategory,
                          productImages: images!,
                          productTag: selectedProductTag,
                          description: _productdescription.text,
                          colors: selectedColor,
                          sizes: selectedSize));
                }
              },
              backgroundColor: CustomColors.kPrimary,
              child: Text(
                "Add Product",
                style: CustomTextStyles.kBold16,
              )),
          SizedBox(height: 40.h),
        ],
      ),
    ));
  }
}
