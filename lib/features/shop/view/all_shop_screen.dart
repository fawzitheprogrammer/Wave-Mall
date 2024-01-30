import 'package:flutter/material.dart';
import 'package:wave_mall_user/features/shop/domain/model/top_seller_model.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/utill/color_resources.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/basewidget/custom_app_bar.dart';
import 'package:wave_mall_user/features/shop/widget/top_seller_view.dart';

class AllTopSellerScreen extends StatelessWidget {
  final TopSellerModel? topSeller;
  final String title;
  const AllTopSellerScreen(
      {super.key, required this.topSeller, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getHomeBg(context).withOpacity(0.8),
      appBar: CustomAppBar(
        title: '${getTranslated(title, context)}',
      ),
      body: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: TopSellerView(isHomePage: false),
      ),
    );
  }
}
