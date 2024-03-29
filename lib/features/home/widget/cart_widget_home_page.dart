import 'package:flutter/material.dart';
import 'package:wave_mall_user/features/cart/controllers/cart_controller.dart';
import 'package:wave_mall_user/features/notification/provider/notification_provider.dart';
import 'package:wave_mall_user/utill/color_resources.dart';
import 'package:wave_mall_user/utill/custom_themes.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/utill/images.dart';
import 'package:wave_mall_user/features/cart/views/cart_screen.dart';
import 'package:wave_mall_user/features/notification/view/notification_screen.dart';
import 'package:provider/provider.dart';

class CartWidgetHomePage extends StatelessWidget {
  const CartWidgetHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Consumer<NotificationProvider>(
            builder: (context, notificationProvider, _) {
          return IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const NotificationScreen())),
            icon: Stack(clipBehavior: Clip.none, children: [
              Image.asset(Images.notification,
                  height: Dimensions.iconSizeDefault,
                  width: Dimensions.iconSizeDefault,
                  color: Theme.of(context).colorScheme.tertiary),
              Positioned(
                top: -4,
                right: -4,
                child: CircleAvatar(
                  radius: 7,
                  backgroundColor: ColorResources.red,
                  child: Text(
                      notificationProvider
                              .notificationModel?.newNotificationItem
                              .toString() ??
                          '0',
                      style: titilliumSemiBold.copyWith(
                        color: ColorResources.white,
                        fontSize: Dimensions.fontSizeExtraSmall,
                      )),
                ),
              ),
            ]),
          );
        }),
        // Padding(
        //   padding: const EdgeInsets.only(right: 12.0),
        //   child: IconButton(
        //     onPressed: () => Navigator.push(
        //         context, MaterialPageRoute(builder: (_) => const CartScreen())),
        //     icon: Stack(clipBehavior: Clip.none, children: [
        //       Image.asset(
        //         Images.cartArrowDownImage,
        //         height: Dimensions.iconSizeDefault,
        //         width: Dimensions.iconSizeDefault,
        //         color: Theme.of(context).colorScheme.tertiary,
        //       ),
        //       Positioned(
        //         top: -4,
        //         right: -4,
        //         child:
        //             Consumer<CartController>(builder: (context, cart, child) {
        //           return CircleAvatar(
        //             radius: 7,
        //             backgroundColor: ColorResources.red,
        //             child: Text(cart.cartList.length.toString(),
        //                 style: titilliumSemiBold.copyWith(
        //                   color: ColorResources.white,
        //                   fontSize: Dimensions.fontSizeExtraSmall,
        //                 )),
        //           );
        //         }),
        //       ),
        //     ]),
        //   ),
        // ),
      ],
    );
  }
}
