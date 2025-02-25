import 'package:logger/logger.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/core/services/auth_service.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class OtpVerificationViewModel extends BaseViewModel {
  OtpVerificationViewModel();

  // Add ViewModel specific code here
  bool codeSend = false;

  final Logger log = getLogger("PhoneAuthViewModel");

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  verifyPhoneNumber(String phoneNumber) async {
    log.e(phoneNumber);
    busy = true;
    codeSend = await _authenticationService.verifyPhoneNumber(phoneNumber);

    // codeSend = _authenticationService.codeSend;
    log.e("code send", codeSend);
    if (codeSend) {
      _navigatorService.navigateTo(SuccessNotification,
          arguments: {"title": "OTP send", "msg": "OTP send to $phoneNumber"});
    } else {
      _navigatorService.navigateTo(ErrorNotification, arguments: {
        "title": "Failed to send OTP",
        "msg": "Try again after some time"
      });
    }
    busy = false;
    notifyListeners();
  }

  verifyOTP(String otp) async {
    busy = true;
    var success = await _authenticationService.verifyOTP(otp);
    log.e(otp);
    log.e("otpsucess====>", success);
    if (success == true) {
      _navigatorService.navigateTo(LocationRoute);
    } else {
      _navigatorService.navigateTo(ErrorNotification, arguments: {
        "title": "Failed to verify an OTP",
        "msg": "Check your OTP and try again"
      });
    }

    busy = false;

    notifyListeners();

    codeSend = _authenticationService.codeSend;
    log.e("adi dekh lo PhoneAuthViewModel", codeSend);
  }

  navToLocation() {
    _navigatorService.navigateTo(SuccessNotification,
        arguments: {"title": "OTP verified", "msg": "Phone number verified"});
    _navigatorService.navigateTo(LocationRoute);
  }

  navToError() {
    _navigatorService.navigateTo(ErrorNotification, arguments: {
      "title": "Failed to verify an OTP",
      "msg": "Check your OTP and try again"
    });
  }

  optSend(String phoneNumber) {
    _navigatorService.navigateTo(SuccessNotification,
        arguments: {"title": "OTP send", "msg": "OTP send to $phoneNumber"});
  }
}
