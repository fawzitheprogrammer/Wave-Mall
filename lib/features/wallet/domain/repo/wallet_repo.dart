import 'package:dio/dio.dart';
import 'package:wave_mall_user/data/datasource/remote/dio/dio_client.dart';
import 'package:wave_mall_user/data/datasource/remote/exception/api_error_handler.dart';
import 'package:wave_mall_user/data/model/api_response.dart';
import 'package:wave_mall_user/main.dart';
import 'package:wave_mall_user/features/splash/provider/splash_provider.dart';
import 'package:wave_mall_user/utill/app_constants.dart';
import 'package:provider/provider.dart';

class WalletTransactionRepo {
  final DioClient? dioClient;
  WalletTransactionRepo({required this.dioClient});

  Future<ApiResponse> getWalletTransactionList(int offset, type) async {
    try {
      Response response = await dioClient!.get(
          '${AppConstants.walletTransactionUri}$offset&transaction_type=$type');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> addFundToWallet(
      String amount, String paymentMethod) async {
    try {
      final response =
          await dioClient!.post(AppConstants.addFundToWallet, data: {
        'payment_platform': 'app',
        'payment_method': paymentMethod,
        'payment_request_from': 'app',
        'amount': amount,
        'current_currency_code':
            Provider.of<SplashProvider>(Get.context!, listen: false)
                .myCurrency!
                .code
      });
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getWalletBonusBannerList() async {
    try {
      Response response = await dioClient!.get(AppConstants.walletBonusList);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
