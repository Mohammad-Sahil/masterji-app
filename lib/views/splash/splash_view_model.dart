import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/core/services/PushNotificationService.dart';
import 'package:masterji_user_app/core/services/auth_service.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class SplashViewModel extends BaseViewModel {
  SplashViewModel();
  var logger = getLogger('SplashViewModel');
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  Future isLoggedIn() async {
    var isLoggedIn = await _authenticationService.isUserLoggedIn();
    print(isLoggedIn);
    if (isLoggedIn is bool) {
      if (isLoggedIn) {
        await _navigatorService.navigateWithPageReplacement(HomePageRoute);
      } else {
        await _navigatorService.navigateWithPageReplacement(OnboardingRoute);
      }
    } else {
      log.e("something went wrong");
    }
  }

  final PushNotificationService _pushNotificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await _pushNotificationService.initialise();
  }
}
