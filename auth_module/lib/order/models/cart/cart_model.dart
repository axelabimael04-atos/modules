import 'package:auth_module/order/models/cart/cart_actions.dart';
import 'package:auth_module/order/models/product/product_on_cart_model.dart';

class Cart extends CartActions{
  List<ProductOnCartModel> productsOnCart;

  Cart(this.productsOnCart);

  @override
  void removeProductOnCart(int index) {
    productsOnCart.removeAt(index);
  }

  @override
  double total() {
    double payment = 0.0;
    for (var i = 0; i < productsOnCart.length; i++) {
      payment = payment + productsOnCart[i].total();
    }
    return payment; 
  }
}