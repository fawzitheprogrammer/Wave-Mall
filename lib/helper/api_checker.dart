import 'dart:developer';

import 'package:wave_mall_user/data/model/api_response.dart';
import 'package:wave_mall_user/data/model/error_response.dart';
import 'package:wave_mall_user/localization/language_constrants.dart';
import 'package:wave_mall_user/main.dart';
import 'package:wave_mall_user/features/auth/controllers/auth_controller.dart';
import 'package:wave_mall_user/basewidget/show_custom_snakbar.dart';
import 'package:provider/provider.dart';

class ApiChecker {
  static void checkApi(ApiResponse apiResponse) {
    if (apiResponse.error == "Failed to load data - status code: 401") {
      Provider.of<AuthController>(Get.context!, listen: false)
          .clearSharedData();
    } else if (apiResponse.response?.statusCode == 500) {
      showCustomSnackBar(
          getTranslated('internal_server_error', Get.context!), Get.context!);
    } else {
      log("==ff=>${apiResponse.error}");
      String? errorMessage = apiResponse.error.toString();
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = ErrorResponse.fromJson(apiResponse.error);
        log(errorResponse.toString());
        //errorMessage = errorResponse.errors?[0].message;
      }
      showCustomSnackBar(errorMessage, Get.context!);
    }
  }
}
