import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/core/services/auth_service.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class AuthPhoneViewModel extends BaseViewModel {
  AuthPhoneViewModel();
  // Add ViewModel specific code here
  final NavigatorService _navigatorService = locator<NavigatorService>();

  onPhoneComplete(String phoneNumController) async {
    // await _prefService.completedSetUp();
    _navigatorService.navigateTo(OTPAuthRoute, arguments: phoneNumController);
  }

  bool codeSend = false;

  final Logger log = getLogger("AuthPhoneViewModel");

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  Future<bool> verifyPhoneNumber(String phoneNumber) async {
    log.e(phoneNumber);
    busy = true;
    //codeSend= await _authenticationService.verifyPhoneNumber(phoneNumber);

    // codeSend = _authenticationService.codeSend;
    //print("code send response " + codeSend.toString());
    // if(codeSend){
    //     _navigatorService.navigateTo(ErrorNotification,
    //         arguments: {"title": "Failed to send OTP", "msg": "Try again after some time"});
    // }
    //   busy = false;
    //  return codeSend;
    _navigatorService.navigateTo(OTPAuthRoute, arguments: "+91" + phoneNumber);
    busy = false;
  }

  verifyOTP(String otp) {
    busy = true;
    var success = _authenticationService.verifyOTP(otp);
    log.e("sucess", success);

    busy = false;

    notifyListeners();

    codeSend = _authenticationService.codeSend;
    log.e("PhoneAuthViewModel", codeSend);
  }

}
