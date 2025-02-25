import 'package:masterji_user_app/core/services/PushNotificationService.dart';
import 'package:masterji_user_app/core/services/auth_service.dart';
import 'package:masterji_user_app/core/services/booking_service.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/core/services/garments_service.dart';
import 'package:masterji_user_app/core/services/order_service.dart';
import 'package:masterji_user_app/core/services/orderpayment.dart';
import 'package:masterji_user_app/core/services/payment_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';

import '../core/logger.dart';
import '../core/services/navigator_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import 'services/analytics_service.dart';

GetIt locator = GetIt.instance;

class LocatorInjector {
  static Logger _log = getLogger('LocatorInjector');

  static Future<void> setupLocator() async {
    _log.d('Initializing Navigator Service');
    locator.registerLazySingleton(() => NavigatorService());
    locator.registerLazySingleton(() => AuthenticationService());
    locator.registerLazySingleton(() => FirestoreService());
    locator.registerLazySingleton(() => GarmentService());
    locator.registerLazySingleton(() => UserService());
    locator.registerLazySingleton(() => PaymentService());
    locator.registerLazySingleton(() => BookingService());
    locator.registerLazySingleton(() => OrderPayment());
    locator.registerLazySingleton(() => OrderService());
    locator.registerLazySingleton(() => PushNotificationService());
    locator.registerLazySingleton(() => AnalyticsService());
  }
}
