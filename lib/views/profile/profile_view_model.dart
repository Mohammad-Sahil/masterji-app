import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/user_service.dart';

class ProfileViewModel extends BaseViewModel {
  ProfileViewModel();
  final UserService _userService = locator<UserService>();
  bool status;

  Map _userProfileData;

  Map get userProfileData => _userProfileData;

  Future saveName({String name}) async {
    busy = true;
    var result = await _userService.saveName(userName: name);
    if (result is String) {
      status = false;
    } else {
      status = true;
    }
    busy = false;
  }

  Future getProfileData() async {
    busy = true;
    var response = await _userService.getProfileData();
    _userProfileData = response;
    busy = false;
  }

  Future listenToUserDetails() async {
    busy = true;
    var userId = await _userService.getPhoneNumber();

    _userService.listenToUserDetails(userId).listen((userDetails) {
      Map updatedUserDetails = userDetails;
      if (updatedUserDetails != null) {
        _userProfileData = updatedUserDetails;
        notifyListeners();
      }

      busy = false;
    });
  }
}
