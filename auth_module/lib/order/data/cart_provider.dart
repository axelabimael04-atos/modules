
import 'package:auth_module/order/models/cart/cart_model.dart';
import 'package:auth_module/order/models/product/product_model.dart';
import 'package:auth_module/order/models/product/product_on_cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{

  List<ProductOnCartModel> _productsOnCart = [];
  late Cart cart;

  CartProvider(){
    cart = Cart(_productsOnCart);
  }

  set addProduct (Product product){
    _productsOnCart.add(ProductOnCartModel(product));
    notifyListeners();
  } 

  set removeProduct (ProductOnCartModel product){
    _productsOnCart.remove(product);
    notifyListeners();
  } 

  notify() => notifyListeners();

}