import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wave_mall_user/features/auth/controllers/auth_controller.dart';
import 'package:wave_mall_user/features/profile/provider/profile_provider.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
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
            child: SizedBox(
              width: 200,
              height: 180,

              child: Image.asset(
                'assets/images/swift_logo.png',
              ),
              //height: 600,
            ),
          ),
        ),
      );
    });
  }
}
