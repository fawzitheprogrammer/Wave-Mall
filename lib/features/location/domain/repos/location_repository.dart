import 'package:dio/dio.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_sixvalley_ecommerce/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_sixvalley_ecommerce/data/model/api_response.dart';
import 'package:flutter_sixvalley_ecommerce/utill/app_constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class LocationRepository {
  final DioClient? dioClient;
  LocationRepository({this.dioClient, });



  Future<ApiResponse> getAddressFromGeocode(LatLng latLng) async {
    try {
      Response response = await dioClient!.get('${AppConstants.geocodeUri}?lat=${latLng.latitude}&lng=${latLng.longitude}');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> searchLocation(String text) async {
    try {
      Response response = await dioClient!.get('${AppConstants.searchLocationUri}?search_text=$text');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> getPlaceDetails(String? placeID) async {
    try {
      Response response = await dioClient!.get('${AppConstants.placeDetailsUri}?placeid=$placeID');
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
