
import 'package:auth_module/order/models/product/product_actions.dart';
import 'package:auth_module/order/models/product/product_model.dart';
import 'package:auth_module/order/models/product/product_on_cart_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ProductOnCartModelMock extends Mock implements ProductOnCartModel {
  ProductOnCartModelMock(Product product);}

void main() {

  

  final productModel = Product(
    name: "Refresco",
    price: 10.0
  );

  late ProductOnCartModel productOnCart;

  setUpAll((){
   productOnCart = ProductOnCartModel(productModel);
  });

  test(
    'veryfing productOnCart argument ',
    () async {
      // assert
      expect(productOnCart, isA<ProductActions>());
    },
  );

  group('verifying productOnCart actions', () {

    test(
    'productOnCart count start on 1',
    () async {
      // assert
      expect(productOnCart.count, 1);
    },
  );
    
    test(
      'should return total, verifying if its correct',
      () async {
        double total = productOnCart.total();
        expect(total, productModel.price * productOnCart.count);
        expect(total, 10.0);
      },
    );

    test(
      'veryfing increment count',
      () async {
        int count = productOnCart.incrementCount();
        expect(count, count++);
        expect(count, 2);
      },
    );

    test(
      'veryfing decrement count',
      () async {
        
        int count = productOnCart.decrementCount();
        if(count == 1){
          expect(count, 1);
        } 

        count = productOnCart.incrementCount();
        expect(count, count++);
        expect(count, 2);
        count = productOnCart.decrementCount();
        expect(count, count--);
        expect(count, 1);
        
      },
    );
  });
}
