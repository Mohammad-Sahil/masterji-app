import 'dart:math';

import 'package:flutter/material.dart';
import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/garments_service.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/route.dart';
import 'package:masterji_user_app/views/selected_garments/selected_garments_view.dart';

class HomepageViewModel extends BaseViewModel {
  HomepageViewModel();
  final NavigatorService _navigatorService = locator<NavigatorService>();
  final UserService _userService = locator<UserService>();
  final GarmentService _garmentService = locator<GarmentService>();
  List<GarmentModel> _ladiesGarments = [];
  List<GarmentModel> get ladiesGarments => _ladiesGarments;
  List<GarmentModel> _gentsGarments = [];
  List<GarmentModel> get gentsGarments => _gentsGarments;
  List<GarmentModel> addgarments = [];
  Future getLadiesCatalog() async {
    busy = true;

    var response = await _userService.getProfileData();
    var cityName = response['address']['city'];
    var result = await _garmentService.getGarments('FEMALE', cityName);
    print(result);
    if (result is List<GarmentModel>) {
      _ladiesGarments = result;
      busy = false;
    } else {}
  }

  Future getGentsCatalog() async {
    busy = true;
    var response = await _userService.getProfileData();
    var cityName = response['address']['city'];
    var result = await _garmentService.getGarments('MALE', cityName);
    print(result);
    if (result is List<GarmentModel>) {
      _gentsGarments = result;
      busy = false;
    } else {}
  }

  Future addGarmentToCart(GarmentModel garmentModel) async {
    addgarments.add(garmentModel);
  }

  Future removeGarmentFromCart(GarmentModel garmentModel) async {
    if (addgarments.length != 0) addgarments.remove(garmentModel);
  }

  navigateToSelectedGarments() async {
    if (addgarments.length != 0)
      await _navigatorService.navigateTo(SelectedGarments,
          arguments: addgarments);
  }

  naviagate() async {
    List<RfOrderItem> order = new List();
    Category seletedCategory =
        new Category(category: "", price: 0, subCategory: "");
    List<Category> _selectedCategoryList = new List();
    _selectedCategoryList.add(seletedCategory);
    addgarments.forEach((element) {
      List<Category> list = [];
      Pricing pricing = new Pricing(
          addOnPrice: 0,
          alterPrice: element.garmentDetails.alterationPrice,
          stitchPrice: element.garmentDetails.stitchingBasePrice,
          totalPrice: element.garmentDetails.stitchingBasePrice);
      RfGarmentDetails garmentDetails = new RfGarmentDetails(
          category: element.category,
          garmentType: element.garmentDetails.garmentType,
          icon: element.garmentDetails.icon);
      if (element.stitchingCategory == null ||
          element.stitchingCategory.length == 0)
        list = [];
      else {
        for (var item in element.stitchingCategory[0].categoryDetails) {
          Category cat = new Category(
              category: element.stitchingCategory[0].category,
              subCategory: item.subcategory,
              price: item.price);
          list.add(cat);
        }
      }
      RfOrderItem item = new RfOrderItem(
          garmentId: element.garmentId,
          pricing: pricing,
          garmentDetails: garmentDetails,
          stitchingCategory: list,
          workType: 0,
          selectedCategory: _selectedCategoryList);
      order.add(item);
    });

    if (order.length != 0) {
      addgarments.clear();
      print(addgarments.length);
      await _navigatorService.navigateTo(SelectedGarments, arguments: order);
    }
    notifyListeners();
  }

  Future addCustomGarment(
      List<String> customgarmentlist, String category) async {
    addgarments.removeWhere((item) =>
        ((item.garmentDetails.alterationPrice == 0 &&
                item.garmentDetails.stitchingBasePrice == 0) ||
            item.garmentDetails.garmentType.isEmpty) &&
        item.category == category);
    customgarmentlist.removeWhere((element) => element.isEmpty);
    customgarmentlist.forEach((element) {
      GarmentDetails d = new GarmentDetails(
        alterationPrice: 0,
        garmentType: element,
        design: [],
        icon: "",
        stitchType: 0,
        stitchingBasePrice: 0,
        stitchingProcess: "",
        totalPrice: 0.0,
      );
      GarmentModel g = new GarmentModel(
        garmentId: element + category,
        category: category,
        city: "",
        garmentDetails: d,
        stitchingCategory: [],
      );
      addgarments.removeWhere((item) => item.garmentId == element + category);
      if (element != null || element.isNotEmpty) addgarments.add(g);
    });
  }

  Future addLadiesCustomGarment(
      List<String> customgarmentlist, String category) async {
    addgarments.removeWhere((item) =>
        ((item.garmentDetails.alterationPrice == 0 &&
                item.garmentDetails.stitchingBasePrice == 0) ||
            item.garmentDetails.garmentType.isEmpty) &&
        item.category == category);
    customgarmentlist.removeWhere((element) => element.isEmpty);
    customgarmentlist.forEach((element) {
      GarmentDetails d = new GarmentDetails(
        alterationPrice: 0,
        garmentType: element,
        design: [],
        icon: "",
        stitchType: 0,
        stitchingBasePrice: 0,
        stitchingProcess: "",
        totalPrice: 0.0,
      );
      GarmentModel g = new GarmentModel(
        garmentId: element + category,
        category: category,
        city: "",
        garmentDetails: d,
        stitchingCategory: [],
      );
      addgarments.removeWhere((item) => item.garmentId == element + category);
      if (element != null || element.isNotEmpty) addgarments.add(g);
    });
  }

  void removeDuplicateCustomGarments(List<String> customgarmentlist) {}

  Future saveFCMToken() async {
    await _userService.saveFCMToken();
  }

  showError() async {
    await _navigatorService.navigateTo(ErrorNotification, arguments: {
      "title": "Service Unavailable",
      "msg": "We are currently not available in your city"
    });
  }
}
