import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class FashionConsultantBookingSuccessViewModel extends BaseViewModel {
  FashionConsultantBookingSuccessViewModel();

  final NavigatorService _navigatorService = locator<NavigatorService>();

  Future gotoHome() async {
    await _navigatorService.popAll(HomePageRoute);
  }

  // Add ViewModel specific code here
}
