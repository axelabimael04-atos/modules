import 'package:auth_module/order/data/cart_provider.dart';
import 'package:auth_module/order/models/product/product_on_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductOnCartWidget extends StatelessWidget{
  final ProductOnCartModel productOnCartModel;

  const ProductOnCartWidget({Key? key, required this.productOnCartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(productOnCartModel.product.name, style: TextStyle(fontWeight: FontWeight.w500)),
        Spacer(),
        IconButton(onPressed: (){
          productOnCartModel.decrementCount();
          Provider.of<CartProvider>(context, listen: false).notify();
        }, icon: Icon(Icons.remove)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(productOnCartModel.count.toString()),
        ),
        IconButton(onPressed: (){
          productOnCartModel.incrementCount();
          Provider.of<CartProvider>(context, listen: false).notify();
        }, icon: Icon(Icons.add)),
        SizedBox(width: 10,),
        IconButton(onPressed: (){

          Provider.of<CartProvider>(context, listen: false).removeProduct = productOnCartModel;
          
        }, icon: Icon(Icons.delete, color: Colors.red,))
      ],
    );
  }
}
  