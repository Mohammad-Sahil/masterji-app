import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masterji_user_app/core/services/noti.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/views/auth_phone/auth_phone_view.dart';
import 'package:masterji_user_app/views/choose_location/choose_location_view.dart';
import 'package:masterji_user_app/views/fashion_consultant_booking_success/fashion_consultant_booking_success_view.dart';
import 'package:masterji_user_app/views/fashionconsultants_vediocall/fashionconsultants_vediocall_view.dart';
import 'package:masterji_user_app/views/garmentordered_details/garmentordered_details_view.dart';
import 'package:masterji_user_app/views/home/home_view.dart';
import 'package:masterji_user_app/views/onboarding_screen/onboarding_screen_view.dart';
import 'package:masterji_user_app/views/otp_verification/otp_verification_view.dart';
import 'package:masterji_user_app/views/selected_garments/selected_garments_view.dart';
import 'utilities/route.dart' as route;
import 'views/confirmvisit/confirmvisit_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case route.LocationRoute:
      int dateFlag = 0;
      return MaterialPageRoute(
          builder: (context) => ChooseLocationView(dateFlag));

    case route.HomePageRoute:
      return MaterialPageRoute(builder: (context) => HomeView());

    case route.OnboardingRoute:
      return MaterialPageRoute(builder: (context) => OnboardingScreenView());
    case route.PhoneAuthRoute:
      return MaterialPageRoute(builder: (context) => AuthPhoneView());
    case route.OTPAuthRoute:
      final phone = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OtpVerificationView(phone));

    case route.VedioCallBook:
      final name = settings.arguments as FashionConsultants;
      return MaterialPageRoute(
          builder: (context) => FashionconsultantsVediocallView(name));

    case route.FashionConsultantBookingConfirm:
      final bookingDetails = settings.arguments as Map;
      return MaterialPageRoute(
          builder: (context) =>
              FashionConsultantBookingSuccessView(bookingDetails));
    case route.SelectedGarments:
      final List<RfOrderItem> selectedGarments =
          settings.arguments as List<RfOrderItem>;
      return MaterialPageRoute(
          builder: (context) => SelectedGarmentsView(selectedGarments));

    case route.ConfirmVisit:
      TotalGarments totalGarments = settings.arguments as TotalGarments;
      return MaterialPageRoute(
          builder: (context) => ConfirmvisitView(totalGarments));

    case route.GarmentsOrdered:
      Map<String, dynamic> map = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => GarmentorderedDetailsView(map));
    case route.ErrorNotification:
      var noti = settings.arguments as Map;
      var title = noti['title'];
      var msg = noti['msg'];
      return buildNotification(
          NotificationService.errorFactory(msg: msg, title: title));

    case route.SuccessNotification:
      var noti = settings.arguments as Map;
      var title = noti['title'];
      var msg = noti['msg'];
      return buildNotification(
          NotificationService.successFactory(msg: msg, title: title));
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}

FlushbarRoute buildNotification(Flushbar type) {
  return FlushbarRoute(
    flushbar: type,
    settings: RouteSettings(name: FLUSHBAR_ROUTE_NAME),
  );
}
