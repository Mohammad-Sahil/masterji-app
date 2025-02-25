import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/model/aboutus.dart';

class AboutusViewModel extends BaseViewModel {
  AboutusViewModel();
 final FirestoreService _firestoreService=locator<FirestoreService>();
  List<AboutUs> _about;
  List<AboutUs> get about => _about;

  Future fetchAboutUs() async {

    busy=true;
    var results=await _firestoreService.getAboutUs();
print(results);
    if(results is List<AboutUs>){
      _about=results;
      
      notifyListeners();
    }else{

    }
    busy=false;
  }

  // Add ViewModel specific code here
}