import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/utilities/route.dart';

class ChooseLocationViewModel extends BaseViewModel {
  ChooseLocationViewModel();

  final UserService _userService = locator<UserService>();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  saveAddress(
      {String address,
      String building,
      String hNo,
      String landmark,
      city,
      state,
      pincode,
      LatLng userLocations,
      int dateFlag,
      BuildContext context}) async {
    var userLocation = {
      "address": address,
      "building": building,
      "houseNo": hNo,
      "landmark": landmark,
      "cityUser": city,
      "state": state,
      "pincode": pincode,
      "userLocation": {
        "latitude": userLocations.latitude,
        "longitude": userLocations.longitude
      },
    };

    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        userLocations.latitude, userLocations.longitude);
    userLocation['city'] = placemark[0].locality.toLowerCase();
    await _userService.saveAddress(
        userLocation: userLocation, dateFlag: dateFlag);
    if (dateFlag == 0) {
      await _navigatorService.navigateWithPageReplacement(HomePageRoute);
    } else if (dateFlag == 1) {
      Phoenix.rebirth(context);
      print("addresss updared");
    }
  }

  UpdateOrderAddress(
      {String address,
      String building,
      String hNo,
      String landmark,
      LatLng userLocations,
      String city,
      state,
      pincode}) async {
    var userLocation = {
      "address": address,
      "building": building,
      "houseNo": hNo,
      "landmark": landmark,
      "cityUser": city,
      "state": state,
      "pincode": pincode
    };
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(
        userLocations.latitude, userLocations.longitude);
    userLocation['city'] = placemark[0].locality.toLowerCase();
    _navigatorService.goBack();
    _navigatorService.goBack(data: userLocation);
  }
}
