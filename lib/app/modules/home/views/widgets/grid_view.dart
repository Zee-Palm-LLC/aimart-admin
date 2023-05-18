import 'package:aimart_admin/app/data/color.dart';
import 'package:aimart_admin/app/data/data.dart';
import 'package:aimart_admin/app/modules/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../../data/helper/product_category.dart';

class ItemInGridSale extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;
  final Color isFavourite;
  const ItemInGridSale({
    Key? key,
    required this.product,
    required this.onPressed,
    required this.isFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240.h,
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: NetworkImage(product.productImages[0]),
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 13.h),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 28.h,
                      decoration: BoxDecoration(
                        color: product.productTag == Tagtype.trending
                            ? CustomColors.kTrendingBlue
                            : product.productTag == Tagtype.discount
                                ? CustomColors.kdarkred
                                : product.productTag ==
                                        Tagtype.bestseller
                                    ? CustomColors.kGreen
                                    : CustomColors.kDarkBlue,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12.w, 2.h, 12.w, 2.h),
                          child: Text(
                            product.productTag == Tagtype.trending
                            ? 'Trending'
                            : product.productTag == Tagtype.discount
                                ? 'Discount'
                                : product.productTag ==
                                        Tagtype.bestseller
                                    ? 'BestSeller'
                                    : 'New',
                            style: CustomTextStyles.kBold12
                                .copyWith(color: CustomColors.kWhite),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    // FavouriteButton(
                    //   onPressed: onPressed,
                    //   isFavourite: isFavourite,
                    // ),
                  ]),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            product.productName,
            style: CustomTextStyles.kBold12
                .copyWith(color: CustomColors.kPrimary),
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${product.productPrice}',
                style: CustomTextStyles.kBold14
                    .copyWith(color: CustomColors.kDarkBlue),
              ),
              SizedBox(width: 8.w),
              Text(
                '\$${product.oldPrice!}',
                style: CustomTextStyles.kMedium14.copyWith(
                  color: CustomColors.kGrey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const Spacer(),
              IconButton(onPressed: onPressed, icon: Icon(Icons.delete,
              size: 24.sp,
              color: CustomColors.kdarkred,
              ))
              // Text(
              //   '\$${product.oldPrice!}',
              //   style: CustomTextStyles.kMedium14.copyWith(
              //     color: CustomColors.kGrey,
              //     decoration: TextDecoration.lineThrough,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
