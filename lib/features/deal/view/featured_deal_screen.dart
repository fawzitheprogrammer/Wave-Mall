import 'package:flutter/material.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/features/deal/provider/featured_deal_provider.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/basewidget/custom_app_bar.dart';
import 'package:wave_mall_user/features/deal/widget/featured_deal_view.dart';
import 'package:provider/provider.dart';

class FeaturedDealScreen extends StatelessWidget {
  const FeaturedDealScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CustomAppBar(title: getTranslated('featured_deals', context)),
      Expanded(
          child: RefreshIndicator(
              backgroundColor: Theme.of(context).primaryColor,
              onRefresh: () async => await Provider.of<FeaturedDealProvider>(
                      context,
                      listen: false)
                  .getFeaturedDealList(true),
              child: const Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                  child: FeaturedDealsView(isHomePage: false))))
    ]));
  }
}
