import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wave_mall_user/features/product/domain/model/product_model.dart';

import 'package:wave_mall_user/helper/product_type.dart';
import 'package:wave_mall_user/features/product/provider/product_provider.dart';
import 'package:wave_mall_user/main.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/basewidget/no_internet_screen.dart';
import 'package:wave_mall_user/basewidget/product_shimmer.dart';
import 'package:wave_mall_user/basewidget/product_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  final bool isHomePage;
  final ProductType productType;
  final ScrollController? scrollController;
  final String? sellerId;

  void shuffleList(List list) {
    var random = Random();
    for (var i = list.length - 1; i > 0; i--) {
      var n = random.nextInt(i + 1);
      var temp = list[i];
      list[i] = list[n];
      list[n] = temp;
    }
  }

  const ProductView(
      {super.key,
      required this.isHomePage,
      required this.productType,
      this.scrollController,
      this.sellerId});

  @override
  Widget build(BuildContext context) {
    print(
        '========= length =========${Provider.of<ProductProvider>(context, listen: false).allProducts.length}==============');
    int offset = 1;
    scrollController?.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
              scrollController!.position.pixels &&
          Provider.of<ProductProvider>(context, listen: false)
              .latestProductList!
              .isNotEmpty &&
          !Provider.of<ProductProvider>(context, listen: false)
              .filterIsLoading) {
        late int pageSize;
        if (productType == ProductType.bestSelling ||
            productType == ProductType.topProduct ||
            productType == ProductType.newArrival ||
            productType == ProductType.discountedProduct) {
          pageSize = (Provider.of<ProductProvider>(context, listen: false)
                      .latestPageSize! /
                  10)
              .ceil();
          offset = Provider.of<ProductProvider>(context, listen: false).lOffset;
        } else if (productType == ProductType.justForYou) {}
        if (offset < pageSize) {
          offset++;
          Provider.of<ProductProvider>(context, listen: false)
              .showBottomLoader();
          if (productType == ProductType.sellerProduct) {
            Provider.of<ProductProvider>(context, listen: false)
                .getSellerProductList(sellerId!, offset, context,
                    reload: false);
          } else {
            Provider.of<ProductProvider>(context, listen: false)
                .getLatestProductList(offset);
          }
        } else {}
      }
    });

    return Consumer<ProductProvider>(
      builder: (context, prodProvider, child) {
        //List<Product> productList = [];

        // if (productType == ProductType.latestProduct) {
        //   productList = prodProvider.allProducts.lProductList ?? [];
        // } else if (productType == ProductType.featuredProduct) {
        //   productList = prodProvider.allProducts.featuredProductList ?? [];
        // } else if (productType == ProductType.topProduct) {
        //   productList = prodProvider.allProducts.latestProductList ?? [];
        // } else if (productType == ProductType.bestSelling) {
        //   productList = prodProvider.allProducts.latestProductList ?? [];
        // } else if (productType == ProductType.newArrival) {
        //   productList = prodProvider.allProducts.latestProductList ?? [];
        // } else if (productType == ProductType.justForYou) {
        //   productList = prodProvider.allProducts.justForYouProduct ?? [];
        // }

        //shuffleList(productList);

        return Column(children: [
          !prodProvider.filterFirstLoading
              ? (prodProvider.allProducts.isNotEmpty)
                  ? MasonryGridView.count(
                      itemCount: isHomePage
                          ? prodProvider.allProducts.length > 4
                              ? 4
                              : prodProvider.allProducts.length
                          : prodProvider.allProducts.length,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        //shuffleList(productList);
                        return ProductWidget(
                            productModel: prodProvider.allProducts[index]);
                      },
                    )
                  : const NoInternetOrDataScreen(isNoInternet: false)
              : ProductShimmer(
                  isHomePage: isHomePage, isEnabled: prodProvider.firstLoading),
          prodProvider.filterIsLoading
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: Dimensions.iconSizeExtraLarge + 30, top: 10),
                  child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ))
              : const SizedBox.shrink(),
          const SizedBox(
            height: 50,
          )
        ]);
      },
    );
  }
}
