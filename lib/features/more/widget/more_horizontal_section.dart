import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/features/more/more_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/cart/controllers/cart_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/wishlist/provider/wishlist_provider.dart';
import 'package:flutter_sixvalley_ecommerce/features/auth/controllers/auth_controller.dart';
import 'package:flutter_sixvalley_ecommerce/features/profile/provider/profile_provider.dart';
import 'package:flutter_sixvalley_ecommerce/features/splash/provider/splash_provider.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/utill/images.dart';
import 'package:flutter_sixvalley_ecommerce/features/cart/views/cart_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/loyaltyPoint/view/loyalty_point_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/offer/offers_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/order/view/order_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/wallet/view/wallet_screen.dart';
import 'package:flutter_sixvalley_ecommerce/features/wishlist/view/wishlist_screen.dart';
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
              horizontal: Dimensions.paddingSizeExtraSmall+10),
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
