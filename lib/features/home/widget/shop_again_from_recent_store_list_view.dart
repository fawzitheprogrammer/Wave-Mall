import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/features/product/provider/product_provider.dart';
import 'package:flutter_sixvalley_ecommerce/basewidget/custom_app_bar.dart';
import 'package:flutter_sixvalley_ecommerce/features/home/widget/shop_again_from_recent_store_card.dart';
import 'package:provider/provider.dart';

class ShopAgainFromYourRecentStoreView extends StatelessWidget {
  final bool isHome;
  const ShopAgainFromYourRecentStoreView({super.key,  this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: getTranslated('recent_store', context),),
      body: Consumer<ProductProvider>(
          builder: (context, shopAgainProvider,_) {
            return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: shopAgainProvider.shopAgainFromRecentStoreList.length,
                itemBuilder: (context, index) {
                  return ShopAgainFromRecentStoreCard(shopAgainFromRecentStoreModel: shopAgainProvider.shopAgainFromRecentStoreList[index]);
                });
          }
      ),
    );
  }
}
