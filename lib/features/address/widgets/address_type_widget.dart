import 'package:flutter/material.dart';
import 'package:wave_mall_user/features/address/domain/model/address_model.dart';
import 'package:wave_mall_user/utill/color_resources.dart';
import 'package:wave_mall_user/utill/custom_themes.dart';
import 'package:wave_mall_user/utill/images.dart';

class AddressListPage extends StatelessWidget {
  final AddressModel? address;
  const AddressListPage({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.red,
      leading: Image.asset(
          address!.addressType == 'Home'
              ? Images.homeImage
              : address!.addressType == 'Workplace'
                  ? Images.bag
                  : Images.moreImage,
          color: Colors.amber,
          height: 30,
          width: 30),
      title: Text(address!.address!,
          style: titilliumRegular.copyWith(color: Colors.black)),
    );
  }
}
