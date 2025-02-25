import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/core/services/user_service.dart';
import 'package:masterji_user_app/model/fabricshops.dart';


class FabricshopsViewModel extends BaseViewModel {
  FabricshopsViewModel();
  
 final UserService _userService = locator<UserService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  List<FabricShops> _shops;
  List<FabricShops> get shops => _shops;
  var cityName;
  

  Future fetchPosts() async {
    busy = true;
    var response = await _userService.getProfileData();
    cityName=response['address']['city'];
   
    var results = await _firestoreService.getFabricShops(cityName);
    busy = false;

    if (results is List<FabricShops>) {
      _shops = results;
      notifyListeners();
    } else {
      print("error");
    }

}
 
}