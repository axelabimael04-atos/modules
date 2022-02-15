import 'package:auth_module/order/models/product/product_on_cart_model.dart';
import 'package:flutter/material.dart';

class ProductResumeWidget extends StatelessWidget {
  final ProductOnCartModel productOnCartModel;

  const ProductResumeWidget({Key? key, required this.productOnCartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text('${productOnCartModel.product.name} x ${productOnCartModel.count}', style: TextStyle(fontWeight: FontWeight.w500)),
          Spacer(),
          Text('\$${productOnCartModel.total()}MXN')
        ],
      ),
    );
  }
}