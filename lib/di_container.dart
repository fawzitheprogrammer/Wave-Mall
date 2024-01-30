import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:wave_mall_user/data/datasource/remote/dio/dio_client.dart';
import 'package:wave_mall_user/features/auth/controllers/facebook_login_controller.dart';
import 'package:wave_mall_user/features/auth/controllers/google_login_controller.dart';
import 'package:wave_mall_user/features/auth/domain/repositories/auth_repository.dart';
import 'package:wave_mall_user/features/banner/controllers/banner_controller.dart';
import 'package:wave_mall_user/features/banner/domain/repositories/banner_repository.dart';
import 'package:wave_mall_user/features/brand/domain/repositories/brand_repository.dart';
import 'package:wave_mall_user/features/cart/domain/repositories/cart_repository.dart';
import 'package:wave_mall_user/features/category/domain/repo/category_repo.dart';
import 'package:wave_mall_user/features/chat/domain/repo/chat_repo.dart';
import 'package:wave_mall_user/features/checkout/domain/repo/checkout_repo.dart';
import 'package:wave_mall_user/features/checkout/provider/checkout_provider.dart';
import 'package:wave_mall_user/features/coupon/domain/repo/coupon_repo.dart';
import 'package:wave_mall_user/features/deal/domain/repo/featured_deal_repo.dart';
import 'package:wave_mall_user/features/address/domain/repo/address_repository.dart';
import 'package:wave_mall_user/features/location/controllers/location_controller.dart';
import 'package:wave_mall_user/features/location/domain/repos/location_repository.dart';
import 'package:wave_mall_user/features/notification/domain/repo/notification_repo.dart';
import 'package:wave_mall_user/features/onboarding/domain/repo/onboarding_repo.dart';
import 'package:wave_mall_user/features/product/domain/repo/product_details_repo.dart';
import 'package:wave_mall_user/features/order/domain/repo/order_repo.dart';
import 'package:wave_mall_user/features/product/domain/repo/product_repo.dart';
import 'package:wave_mall_user/features/profile/domain/repo/profile_repo.dart';
import 'package:wave_mall_user/features/product/domain/repo/home_category_product_repo.dart';
import 'package:wave_mall_user/features/product/domain/repo/search_repo.dart';
import 'package:wave_mall_user/features/shop/domain/repo/shop_repo.dart';
import 'package:wave_mall_user/features/shop/domain/repo/top_seller_repo.dart';
import 'package:wave_mall_user/features/splash/domain/repo/splash_repo.dart';
import 'package:wave_mall_user/features/support/domain/repo/support_ticket_repo.dart';
import 'package:wave_mall_user/features/wallet/domain/repo/wallet_repo.dart';
import 'package:wave_mall_user/features/wishlist/domain/repo/wishlist_repo.dart';
import 'package:wave_mall_user/features/compare/domain/repo/compare_repo.dart';
import 'package:wave_mall_user/features/compare/provider/compare_provider.dart';
import 'package:wave_mall_user/features/deal/domain/repo/flash_deal_repo.dart';
import 'package:wave_mall_user/features/loyaltyPoint/domain/repo/loyalty_point_repo.dart';
import 'package:wave_mall_user/features/loyaltyPoint/provider/loyalty_point_provider.dart';
import 'package:wave_mall_user/helper/network_info.dart';
import 'package:wave_mall_user/features/auth/controllers/auth_controller.dart';
import 'package:wave_mall_user/features/brand/controllers/brand_controller.dart';
import 'package:wave_mall_user/features/cart/controllers/cart_controller.dart';
import 'package:wave_mall_user/features/category/controllers/category_controller.dart';
import 'package:wave_mall_user/features/chat/provider/chat_provider.dart';
import 'package:wave_mall_user/features/coupon/provider/coupon_provider.dart';
import 'package:wave_mall_user/features/deal/provider/featured_deal_provider.dart';
import 'package:wave_mall_user/features/deal/provider/flash_deal_provider.dart';
import 'package:wave_mall_user/features/product/provider/home_category_product_provider.dart';
import 'package:wave_mall_user/localization/provider/localization_provider.dart';
import 'package:wave_mall_user/features/address/controllers/address_controller.dart';
import 'package:wave_mall_user/features/notification/provider/notification_provider.dart';
import 'package:wave_mall_user/features/onboarding/provider/onboarding_provider.dart';
import 'package:wave_mall_user/features/product/provider/product_details_provider.dart';
import 'package:wave_mall_user/features/order/provider/order_provider.dart';
import 'package:wave_mall_user/features/product/provider/product_provider.dart';
import 'package:wave_mall_user/features/profile/provider/profile_provider.dart';
import 'package:wave_mall_user/features/product/provider/search_provider.dart';
import 'package:wave_mall_user/features/shop/provider/shop_provider.dart';
import 'package:wave_mall_user/features/splash/provider/splash_provider.dart';
import 'package:wave_mall_user/features/support/provider/support_ticket_provider.dart';
import 'package:wave_mall_user/theme/provider/theme_provider.dart';
import 'package:wave_mall_user/features/shop/provider/top_seller_provider.dart';
import 'package:wave_mall_user/features/wallet/provider/wallet_provider.dart';
import 'package:wave_mall_user/features/wishlist/provider/wishlist_provider.dart';
import 'package:wave_mall_user/utill/app_constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(),
      loggingInterceptor: sl(), sharedPreferences: sl()));

  // Repository
  sl.registerLazySingleton(() => CategoryRepository(dioClient: sl()));
  sl.registerLazySingleton(() => HomeCategoryProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => TopSellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FlashDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => FeaturedDealRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BrandRepository(dioClient: sl()));
  sl.registerLazySingleton(() => ProductRepo(dioClient: sl()));
  sl.registerLazySingleton(() => BannerRepository(dioClient: sl()));
  sl.registerLazySingleton(() => OnBoardingRepo(dioClient: sl()));
  sl.registerLazySingleton(
      () => AuthRepository(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => ProductDetailsRepo(dioClient: sl()));
  sl.registerLazySingleton(
      () => SearchRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => OrderRepo(dioClient: sl()));
  sl.registerLazySingleton(() => SellerRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CouponRepo(dioClient: sl()));
  sl.registerLazySingleton(() => ChatRepo(dioClient: sl()));
  sl.registerLazySingleton(() => NotificationRepo(dioClient: sl()));
  sl.registerLazySingleton(
      () => ProfileRepo(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(() => WishListRepo(dioClient: sl()));
  sl.registerLazySingleton(
      () => CartRepository(dioClient: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton(
      () => SplashRepo(sharedPreferences: sl(), dioClient: sl()));
  sl.registerLazySingleton(() => SupportTicketRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AddressRepository(dioClient: sl()));
  sl.registerLazySingleton(() => WalletTransactionRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CompareRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LoyaltyPointRepo(dioClient: sl()));
  sl.registerLazySingleton(() => CheckOutRepo(dioClient: sl()));
  sl.registerLazySingleton(() => LocationRepository(dioClient: sl()));

  // Provider
  sl.registerFactory(() => CategoryController(categoryRepo: sl()));
  sl.registerFactory(
      () => HomeCategoryProductProvider(homeCategoryProductRepo: sl()));
  sl.registerFactory(() => TopSellerProvider(topSellerRepo: sl()));
  sl.registerFactory(() => FlashDealProvider(megaDealRepo: sl()));
  sl.registerFactory(() => FeaturedDealProvider(featuredDealRepo: sl()));
  sl.registerFactory(() => BrandController(brandRepo: sl()));
  sl.registerFactory(() => ProductProvider(productRepo: sl()));
  sl.registerFactory(() => BannerController(bannerRepo: sl()));
  sl.registerFactory(() => OnBoardingProvider(onboardingRepo: sl()));
  sl.registerFactory(() => AuthController(authRepo: sl()));
  sl.registerFactory(() => ProductDetailsProvider(productDetailsRepo: sl()));
  sl.registerFactory(() => SearchProvider(searchRepo: sl()));
  sl.registerFactory(() => OrderProvider(orderRepo: sl()));
  sl.registerFactory(() => SellerProvider(sellerRepo: sl()));
  sl.registerFactory(() => CouponProvider(couponRepo: sl()));
  sl.registerFactory(() => ChatProvider(chatRepo: sl()));
  sl.registerFactory(() => NotificationProvider(notificationRepo: sl()));
  sl.registerFactory(() => ProfileProvider(profileRepo: sl()));
  sl.registerFactory(
      () => WishListProvider(wishListRepo: sl(), productDetailsRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));
  sl.registerFactory(() => CartController(cartRepo: sl()));
  sl.registerFactory(() => SupportTicketProvider(supportTicketRepo: sl()));
  sl.registerFactory(
      () => LocalizationProvider(sharedPreferences: sl(), dioClient: sl()));
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => GoogleSignInController());
  sl.registerFactory(() => FacebookLoginController());
  sl.registerFactory(() => AddressController(addressRepo: sl()));
  sl.registerFactory(() => WalletTransactionProvider(transactionRepo: sl()));
  sl.registerFactory(() => CompareProvider(compareRepo: sl()));
  sl.registerFactory(() => LoyaltyPointProvider(loyaltyPointRepo: sl()));
  sl.registerFactory(() => CheckOutProvider(checkOutRepo: sl()));
  sl.registerFactory(() => LocationController(locationRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
  sl.registerLazySingleton(() => Connectivity());
}
