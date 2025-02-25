import 'package:firebase_auth/firebase_auth.dart';
import 'package:masterji_user_app/core/base/base_service.dart';

class AuthenticationService extends BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _verificationId = "";
  bool codeSend = false;

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    if (user != null) print(user.phoneNumber);
    return user != null;
  }

  Future<bool> verifyPhoneNumber(String _phoneNumber) async {
    String phoneNumber = "+91" + _phoneNumber;
    log.d(phoneNumber);

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 120),
        verificationCompleted: (authCredential) =>
            _verificationComplete(authCredential),
        verificationFailed: (authException) =>
            _verificationFailed(authException),
        codeAutoRetrievalTimeout: (verificationId) =>
            _codeAutoRetrievalTimeout(verificationId),
        codeSent: (verificationId, [code]) {
          _verificationId = verificationId;
          codeSend = true;
          log.i("send smsVerificationCode :" + verificationId);
        });
    return codeSend;
  }

  _verificationComplete(AuthCredential authCredential) {
    FirebaseAuth.instance
        .signInWithCredential(authCredential)
        .then((authResult) {
      log.i("Success!!! UUID is: " + authResult.user.uid);
    });
  }

  _verificationFailed(AuthException authException) {
    log.e("check Exception!! message:" + authException.message.toString());
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    log.i("timeout");
    log.i("_smsVerificationCode" + verificationId);
  }

  verifyOTP(String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.getCredential(
          verificationId: _verificationId, smsCode: smsCode);
      AuthResult authResult =
          await _firebaseAuth.signInWithCredential(credential);
      FirebaseUser user = await _firebaseAuth.currentUser();
      return user != null;
    } catch (e) {
      return false;
    }
  }
}
