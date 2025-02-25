import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/utilities/all_translations.dart';
import 'package:masterji_user_app/utilities/route.dart';

class ChooseLanguageViewModel extends BaseViewModel {
  ChooseLanguageViewModel();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  changeLang(String lang) async {
    await allTranslations.setNewLanguage(lang);

    _navigatorService.navigateTo(OnboardingRoute);
  }

  navigateToHome() async {
    _navigatorService.navigateTo(HomePageRoute);
  }

  // Add ViewModel specific code here
}
