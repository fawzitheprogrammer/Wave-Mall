import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wave_mall_user/features/category/controllers/category_controller.dart';
import 'package:wave_mall_user/features/product/provider/product_provider.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/main.dart';
import 'package:wave_mall_user/utill/custom_themes.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/utill/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool isBackButtonExist;
  final bool showActionButton;
  final Function()? onBackPressed;
  final bool centerTitle;
  final double? fontSize;
  final bool showResetIcon;
  final Widget? reset;
  final bool showLogo;
  final bool reloadProduct;

  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.centerTitle = false,
    this.showActionButton = true,
    this.fontSize,
    this.showResetIcon = false,
    this.reset,
    this.showLogo = false,
    this.reloadProduct = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
            actions: showResetIcon ? [reset!] : [],
            backgroundColor: Theme.of(context).cardColor,
            toolbarHeight: 50,
            iconTheme: IconThemeData(
                color: Theme.of(context).textTheme.bodyLarge?.color),
            automaticallyImplyLeading: false,
            title: Text(title ?? '',
                style: textMedium.copyWith(
                    fontSize: Dimensions.fontSizeLarge,
                    color: Theme.of(context).textTheme.bodyLarge?.color),
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis),
            centerTitle: true,
            excludeHeaderSemantics: true,
            titleSpacing: 0,
            elevation: 1,
            clipBehavior: Clip.none,
            shadowColor: Theme.of(context).primaryColor.withOpacity(.1),
            leadingWidth: isBackButtonExist ? 50 : 120,
            leading: isBackButtonExist
                ? IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color
                          ?.withOpacity(.75),
                    ),
                    onPressed: () async {
                      if (onBackPressed != null) {
                        onBackPressed!();
                      } else {
                        Navigator.pop(context);
                        if (reloadProduct) {
                          await Provider.of<ProductProvider>(Get.context!,
                                  listen: false)
                              .getLProductList('1', reload: reloadProduct);
                          await Provider.of<ProductProvider>(Get.context!,
                                  listen: false)
                              .getLatestProductList(1, reload: true);
                        }
                      }
                    },
                  )
                : showLogo
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: Dimensions.paddingSizeDefault),
                        child: SizedBox(
                            child: Image.asset(Images.logoWithNameImage)))
                    : const SizedBox()));
  }

  @override
  Size get preferredSize => Size(MediaQuery.of(Get.context!).size.width, 50);
}
