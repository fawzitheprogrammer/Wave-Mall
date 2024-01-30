import 'package:wave_mall_user/data/datasource/remote/dio/dio_client.dart';
import 'package:wave_mall_user/data/datasource/remote/exception/api_error_handler.dart';
import 'package:wave_mall_user/data/model/api_response.dart';
import 'package:wave_mall_user/utill/app_constants.dart';

class FeaturedDealRepo {
  final DioClient? dioClient;
  FeaturedDealRepo({required this.dioClient});

  Future<ApiResponse> getFeaturedDeal() async {
    try {
      final response = await dioClient!.get(AppConstants.featuredDealUri);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
