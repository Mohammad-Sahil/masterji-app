import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class OnboardingScreenViewModel extends BaseViewModel {
  OnboardingScreenViewModel();
  
  // Add ViewModel specific code here
    final NavigatorService _navigatorService = locator<NavigatorService>();

  onBoardingComplete() async {
   // await _prefService.completedSetUp();
    await _navigatorService.navigateTo(PhoneAuthRoute);
  }
}