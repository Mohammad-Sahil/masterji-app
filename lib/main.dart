import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:masterji_user_app/core/services/analytics_service.dart';
import 'package:masterji_user_app/core/theme.dart';
import 'package:masterji_user_app/router.dart';
import 'package:masterji_user_app/utilities/all_translations.dart';
import 'package:masterji_user_app/views/splash/splash_view.dart';
import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocatorInjector.setupLocator();
  await allTranslations.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(Phoenix(child: MainApplication()));
  });
}

class MainApplication extends StatefulWidget {
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  void initState() {
    super.initState();
    allTranslations.onLocaleChangedCallback = _onLocaleChanged;
  }

  _onLocaleChanged() async {
    print('Language has been changed to: ${allTranslations.currentLanguage}');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorObservers: [
          locator<AnalyticsService>().getAnalyticsObserver(),
        ],
        // Tells the system which are the supported languages
        supportedLocales: allTranslations.supportedLocales(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: generateRoute,
        navigatorKey: locator<NavigatorService>().navigatorKey,

        //home: ChooseLanguageView(),
        home: SplashView(),
        //home:ChooseLocationView(),
        //home: FashionconsultantsVediocallView(),
        //home: HomeView(),
        theme: appTheme,
      ),
    );
  }
}
