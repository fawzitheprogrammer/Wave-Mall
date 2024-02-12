import 'package:flutter/material.dart';
import 'package:wave_mall_user/helper/product_type.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/utill/color_resources.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/basewidget/custom_app_bar.dart';
import 'package:wave_mall_user/features/product/widget/products_view.dart';

class AllProductScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final ProductType productType;
  AllProductScreen({super.key, required this.productType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context),
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          title: productType == ProductType.featuredProduct
              ? '${getTranslated('featured_product', context)}'
              : productType == ProductType.justForYou
                  ? '${getTranslated('just_for_you', context)}'
                  : '${getTranslated('latest_product', context)}'),
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onRefresh: () async {
            
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: ProductView(
                      isHomePage: false,
                      productType: productType,
                      scrollController: _scrollController),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
