import 'package:flutter/material.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/features/more/more_screen.dart';
import 'package:wave_mall_user/features/cart/controllers/cart_controller.dart';
import 'package:wave_mall_user/features/wishlist/provider/wishlist_provider.dart';
import 'package:wave_mall_user/features/auth/controllers/auth_controller.dart';
import 'package:wave_mall_user/features/profile/provider/profile_provider.dart';
import 'package:wave_mall_user/features/splash/provider/splash_provider.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/utill/images.dart';
import 'package:wave_mall_user/features/cart/views/cart_screen.dart';
import 'package:wave_mall_user/features/loyaltyPoint/view/loyalty_point_screen.dart';
import 'package:wave_mall_user/features/offer/offers_screen.dart';
import 'package:wave_mall_user/features/order/view/order_screen.dart';
import 'package:wave_mall_user/features/wallet/view/wallet_screen.dart';
import 'package:wave_mall_user/features/wishlist/view/wishlist_screen.dart';
import 'package:provider/provider.dart';

class MoreHorizontalSection extends StatelessWidget {
  const MoreHorizontalSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isGuestMode =
        !Provider.of<AuthController>(context, listen: false).isLoggedIn();
    return Consumer<ProfileProvider>(builder: (context, profileProvider, _) {
      return SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.paddingSizeExtraSmall + 10),
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/banner.jpeg'),
                ),
              ),
              width: double.infinity,
              //height: 600,
            ),
          ),
        ),
      );
    });
  }
}
