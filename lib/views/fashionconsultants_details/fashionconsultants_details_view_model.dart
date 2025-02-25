import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/utilities/route.dart';

class FashionconsultantsDetailsViewModel extends BaseViewModel {
  FashionconsultantsDetailsViewModel();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  // Add ViewModel specific code here

  FashionBookingCall(FashionConsultants fashionConsultants) async {
    // await _prefService.completedSetUp();
    await _navigatorService.navigateTo(VedioCallBook,
        arguments: fashionConsultants);
  }
}
