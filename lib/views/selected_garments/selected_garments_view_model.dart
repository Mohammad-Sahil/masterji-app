import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/garments_service.dart';
import 'package:masterji_user_app/core/services/navigator_service.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/model/totalgarments.dart';
import 'package:masterji_user_app/utilities/route.dart';

class SelectedGarmentsViewModel extends BaseViewModel {
  SelectedGarmentsViewModel();

  final NavigatorService _navigatorService = locator<NavigatorService>();
  final UserService _userService = locator<UserService>();
  final GarmentService _garmentService = locator<GarmentService>();
  Map _userProfileData;
  String stichingProcess;
  Map get userProfileData => _userProfileData;
  List<GarmentModel> _selectedGarmentList;
  List<GarmentModel> get selectedGarmentList => _selectedGarmentList;
  Set s = new Set();
  List<RfOrderItem> orderItem;
  int totalPrice = 0;
  String commentedData = "";

  void addSeletedGarment(List<RfOrderItem> selectedGarments) {
    orderItem = new List();
    orderItem.addAll(selectedGarments);
  }

  Future getProfileData() async {
    busy = true;
    var response = await _userService.getProfileData();
    _userProfileData = response;
    busy = false;
  }

  calculateTotal() {
    busy = true;
    totalPrice = 0;
    orderItem.forEach((element) {
      totalPrice += element.pricing.totalPrice;
    });
    busy = false;
  }

  initalTotalPrice() {
    totalPrice = 0;
    orderItem.forEach((element) {
      totalPrice += element.pricing.totalPrice;
    });
  }

  void removeGarment(RfOrderItem garmentModel) async {
    busy = true;
    orderItem.removeWhere((item) => item.garmentId == garmentModel.garmentId);
    print(orderItem);
    if (orderItem.length == 0) {
      await _navigatorService.popAll(HomePageRoute);
    }
    calculateTotal();
    busy = false;
  }

  void selectAddOn(String label, String price, int index) {
    busy = true;
    // * updating selected garment
    orderItem[index].selectedCategory[0].category = "Sticting Type";
    orderItem[index].selectedCategory[0].price = int.parse(price);
    orderItem[index].selectedCategory[0].subCategory = label;

    // *updating total pricig and addon price
    orderItem[index].pricing.totalPrice =
        int.parse(price) + orderItem[index].pricing.totalPrice;

    orderItem[index].pricing.addOnPrice += int.parse(price);

    calculateTotal();
    busy = false;
  }

  void removeAddOn(int index, String price) {
    busy = true;
    // * updating selected garment (removing it)
    orderItem[index].selectedCategory[0].category = "Sticting Type";
    orderItem[index].selectedCategory[0].price = 0;
    orderItem[index].selectedCategory[0].subCategory = "";

    // *updating total pricig and addon price
    orderItem[index].pricing.totalPrice -= int.parse(price);
    orderItem[index].pricing.addOnPrice -= int.parse(price);

    calculateTotal();
    busy = false;
  }

  void setAlteration(int index) {
    busy = true;
    orderItem[index].workType = 1;
    orderItem[index].pricing.totalPrice = orderItem[index].pricing.alterPrice;
    orderItem[index].selectedCategory[0].category = "";
    orderItem[index].selectedCategory[0].price = 0;
    orderItem[index].selectedCategory[0].subCategory = "";
    calculateTotal();
    busy = false;
  }

  void setStitching(int index) {
    busy = true;
    orderItem[index].workType = 0;
    orderItem[index].pricing.totalPrice = orderItem[index].pricing.stitchPrice;
    orderItem[index].selectedCategory[0].category = "";
    orderItem[index].selectedCategory[0].price = 0;
    orderItem[index].selectedCategory[0].subCategory = "";
    calculateTotal();
    busy = false;
  }

  getComment(String commentData) {
    commentedData = commentData;
  }

  onConfirm() {
    TotalGarments totalGarments = new TotalGarments(
        bookingDate: "",
        bookingTime: "",
        commentData: commentedData,
        rfOrderItem: orderItem);

    _navigatorService.navigateTo(ConfirmVisit, arguments: totalGarments);
  }

  Future getStitchingProcess(int index) async {
    var id = orderItem[index].garmentId;
    stichingProcess = await _garmentService.getStitchingProcess(id);
    return stichingProcess;
  }
}
