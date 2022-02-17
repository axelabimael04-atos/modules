
import 'package:auth_module/order/models/cart/cart_actions.dart';
import 'package:auth_module/order/models/cart/cart_model.dart';
import 'package:auth_module/order/models/product/product_model.dart';
import 'package:auth_module/order/models/product/product_on_cart_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {

  final productModels = [

    Product(
      name: "Refresco",
      price: 10
    ),
    Product(
      name: "Sabritas",
      price: 15
    ),
    Product(
      name: "Salsa",
      price: 12.5
    ),

  ];

  final productsOnCart = productModels.map((e) => ProductOnCartModel(e)).toList();

  final cart = Cart(productsOnCart);

  test('Verify Cart argument is list<ProductOnCartModel>', (){

    expect(productsOnCart, isA<List<ProductOnCartModel>>());
    expect(cart, isA<CartActions>());

  });

  test('Verify total Cart', (){

    double totalCart = cart.total();

    double totalExpected = 0.0;

    productsOnCart.forEach((element) => totalExpected += element.product.price);

    expect(totalCart, 37.5);
    expect(totalCart, totalExpected);
    
  });
  
}