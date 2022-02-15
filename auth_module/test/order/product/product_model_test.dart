
import 'dart:convert';
import 'dart:io';
import 'package:auth_module/order/models/product/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  final productModel = Product(
    name: "Refresco",
    price: 10
  );

  test(
    'should be a subclass of Product',
    () async {
      // assert
      expect(productModel, isA<Product>());
    },
  );

  group('fromJson', () {

    String jsonProduct = File('test/order/products.json').readAsStringSync();
    
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(jsonProduct);
        // act
        final result = Product.fromJson(jsonMap);
        // assert
        expect(result, productModel);
      },
    );

    test(
      'should return a valid model when the JSON number is regarded as a double',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(jsonProduct);
        // act
        final result = Product.fromJson(jsonMap);
        // assert
        expect(result, productModel);
      },
    );
  });
}
