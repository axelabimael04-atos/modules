import 'package:auth_module/order/data/cart_provider.dart';
import 'package:auth_module/order/models/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Text(product.name, style: TextStyle(fontWeight: FontWeight.w500)),

          SizedBox(width: 10,),
          
          Text('\$${product.price} MXN'),
          Spacer(),
          TextButton(onPressed: (){
            Provider.of<CartProvider>(context, listen: false).addProduct = product;
          }, child: Text('Agregar'))
        ],
      ),
    );
  }
}