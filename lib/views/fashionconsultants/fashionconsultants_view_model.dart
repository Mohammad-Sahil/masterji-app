import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/logger.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/model/fashionconsultants.dart';

class FashionconsultantsViewModel extends BaseViewModel {
  FashionconsultantsViewModel();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  // Add ViewModel specific code here
   List<FashionConsultants> _consultants;
  List<FashionConsultants> get consultants => _consultants;
  var logger=getLogger("FashionconsultantsViewModel");

  Future fetchConsultants() async {
    busy = true;
    var results = await _firestoreService.getFashionConsultants();
    

    if (results is List<FashionConsultants>) {
      _consultants = results;
      busy = false;
      notifyListeners();
    } else {
      logger.i("not fashionlist");
    }
}
}