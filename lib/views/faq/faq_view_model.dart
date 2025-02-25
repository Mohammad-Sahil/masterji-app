import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/firestore.dart';
import 'package:masterji_user_app/model/faq.dart';

class FaqViewModel extends BaseViewModel {
  FaqViewModel();
    final FirestoreService _firestoreService = locator<FirestoreService>();
 
   List<Faq> _faq;
  List<Faq> get faqs => _faq;
  // Add ViewModel specific code here

  Future fetchFaq() async {
    busy = true;
    var results = await _firestoreService.getFaq();
  

    if (results is List<Faq>) {
    _faq = results;
    print(results);
      notifyListeners();
    } else {
      
    }
      busy = false;
}

}