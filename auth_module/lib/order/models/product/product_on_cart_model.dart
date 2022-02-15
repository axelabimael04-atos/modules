import 'package:auth_module/order/models/product/product_actions.dart';
import 'package:auth_module/order/models/product/product_model.dart';

class ProductOnCartModel extends ProductActions{
  Product product;
  int count = 1;

  ProductOnCartModel(this.product);

  @override
  double total() => product.price * count;

  @override
  int decrementCount() => count > 1 ? count-- : count;

  @override
  int incrementCount() => count++;

}