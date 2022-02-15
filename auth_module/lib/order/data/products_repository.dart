import 'package:auth_module/order/models/product/product_model.dart';

class ProductsRepository {
  static List<Product> products = [
    Product.fromJson({'name': 'Refresco', 'price': 15}),
    Product.fromJson({'name': 'Sabritas', 'price': 42.0}),
    Product.fromJson({'name': 'Salsa', 'price': 12.5}),
  ];
}