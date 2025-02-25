import 'package:masterji_user_app/core/base/base_view_model.dart';
import 'package:masterji_user_app/model/garment.dart';
import 'package:masterji_user_app/model/order.dart';

class OrderCustomizeViewModel extends BaseViewModel {
  OrderCustomizeViewModel();

  GarmentModel _model;
  OrderItem _orderItem;
  List<Customisation> customistaionList;
  int totalPrice = 0;
  int afterCustomisePrice = 0;
  int tempIndex;
  int previousprice = 0;
  int baseprice = 0;
  GarmentModel get garmentModel => _model;


  void setGarmentModel(GarmentModel model, double totalPrice,int index,int previousPrice) {
    
    busy = true;
    if(index!= null && previousPrice!=null){
      tempIndex=index;
      previousprice=previousPrice;
    }
    afterCustomisePrice = totalPrice != 0
        ? totalPrice.toInt()
        : model.garmentDetails.stitchingBasePrice;
    baseprice =model.garmentDetails.stitchingBasePrice;
    customistaionList = List();
    _model = model;
    _orderItem = new OrderItem(
        basePrice: _model.garmentDetails.stitchingBasePrice,
        category: _model.category,
        garmentType: _model.garmentDetails.garmentType,
        garmentId: _model.garmentId,
        workType: 0,
        customisation: List());
    busy = false;
  }

  void addCustomistaion(CategoryDetail categoryDetail, int index) {
    busy = true;
    Customisation _customisation = new Customisation(
        type: categoryDetail.subcategory, price: categoryDetail.price);
        
    if (tempIndex == index) {
      afterCustomisePrice -= previousprice;
      afterCustomisePrice += categoryDetail.price;
    } else {
      afterCustomisePrice = baseprice + previousprice + categoryDetail.price;
    }
    customistaionList.add(_customisation);
    print("adding");
    customistaionList.forEach((element) {
      print(element.toJson());
    });
    print(customistaionList.length);
    tempIndex = index;
    previousprice = categoryDetail.price;
    busy = false;
  }

  void removeCustomisation(CategoryDetail categoryDetail, int index) {
    busy = true;
    Customisation _customisation = new Customisation(
        category: garmentModel.category,
        type: categoryDetail.subcategory,
        price: categoryDetail.price);

    afterCustomisePrice -= categoryDetail.price;
    customistaionList.forEach((element) {
      print(element.toJson());
    });
    customistaionList.removeWhere((item) =>
        item.type == _customisation.type && item.price == _customisation.price);
    print("removing");
    print(customistaionList.length);
    if (tempIndex == index) {
      previousprice = 0;
    }
    busy = false;
  }

  getOrderItem() {
    customistaionList.forEach((element) {
      totalPrice = element.price + totalPrice;
    });
    _orderItem.customisation.addAll(customistaionList);

    _orderItem.totalPrice = afterCustomisePrice.toDouble();
   Prev _prev=new Prev(
   
orderItem:_orderItem,
prevRate:previousprice,
index:tempIndex

   );
    return _prev;
  }

  void clearAll() {
    busy = true;
    _model = null;
    _orderItem = null;
    customistaionList = null;
    totalPrice = 0;
    afterCustomisePrice = 0;
    tempIndex = null;
    previousprice = 0;
    baseprice = 0;
    busy = false;
  }

}
class Prev{
  OrderItem orderItem;
  int prevRate;
  int index;
  Prev({this.orderItem,this.index,this.prevRate});
}