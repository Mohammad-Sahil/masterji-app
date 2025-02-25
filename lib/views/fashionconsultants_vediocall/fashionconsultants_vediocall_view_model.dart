import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/core/locator.dart';
import 'package:masterji_user_app/core/services/payment_service.dart';

class FashionconsultantsVediocallViewModel extends BaseViewModel {
  FashionconsultantsVediocallViewModel();

  final PaymentService _paymentService = locator<PaymentService>();
  bookFashionConsultant(
      {int amount,
      String bookingDate,
      bookingTime,
      consultantId,
      expertise,
      consultantImage,
      consultantName}) async {
    await _paymentService.openCheckout(
        amount: amount,
        bookingDate: bookingDate,
        bookingTime: bookingTime,
        consultantId: consultantId,
        expertise:expertise,
        consultantImage:consultantImage,
        consultantName: consultantName);
  }
}
