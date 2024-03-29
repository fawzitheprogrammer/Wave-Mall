import 'package:flutter/material.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/features/splash/provider/splash_provider.dart';
import 'package:wave_mall_user/utill/custom_themes.dart';
import 'package:wave_mall_user/utill/dimensions.dart';
import 'package:wave_mall_user/basewidget/custom_button.dart';
import 'package:provider/provider.dart';

class SelectCurrencyBottomSheet extends StatefulWidget {
  const SelectCurrencyBottomSheet({super.key});

  @override
  State<SelectCurrencyBottomSheet> createState() =>
      _SelectCurrencyBottomSheetState();
}

class _SelectCurrencyBottomSheetState extends State<SelectCurrencyBottomSheet> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex =
        Provider.of<SplashProvider>(context, listen: false).currencyIndex ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(builder: (context, currencyProvider, _) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 40, top: 15),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Dimensions.paddingSizeDefault))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor.withOpacity(.5),
                    borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                getTranslated('select_currency', context)!,
                style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: Dimensions.paddingSizeSmall,
                    bottom: Dimensions.paddingSizeSmall),
                child: Text(
                    '${getTranslated('choose_your_currency_to_proceed', context)}',
                    textAlign: TextAlign.center,
                    style: textRegular),
              ),
              if (currencyProvider.configModel != null &&
                  currencyProvider.configModel!.currencyList != null &&
                  currencyProvider.configModel!.currencyList!.isNotEmpty)
                ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              Dimensions.paddingSizeDefault,
                              0,
                              Dimensions.paddingSizeDefault,
                              0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.paddingSizeExtraSmall),
                                color: selectedIndex == index
                                    ? Theme.of(context)
                                        .primaryColor
                                        .withOpacity(.1)
                                    : Theme.of(context).cardColor),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Dimensions.paddingSizeDefault,
                                  vertical: Dimensions.paddingSizeEight),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(
                                        Dimensions.paddingSizeEight),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedIndex == index
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .primaryColor
                                                .withOpacity(.5)),
                                    child: Text(
                                      currencyProvider.configModel!
                                              .currencyList![1].symbol ??
                                          '',
                                      style: textRegular.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal:
                                            Dimensions.paddingSizeSmall),
                                    child: Padding(
                                      padding: const EdgeInsets.all(
                                          Dimensions.paddingSizeSmall),
                                      child: Text(currencyProvider
                                          .configModel!.currencyList![1].name!),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    Dimensions.paddingSizeSmall,
                    Dimensions.paddingSizeSmall,
                    Dimensions.paddingSizeSmall,
                    0),
                child: CustomButton(
                  buttonText: '${getTranslated('select', context)}',
                  onTap: () {
                    Provider.of<SplashProvider>(context, listen: false)
                        .setCurrency(selectedIndex);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
