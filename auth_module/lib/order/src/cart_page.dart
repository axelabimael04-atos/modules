import 'package:auth_module/order/data/cart_provider.dart';
import 'package:auth_module/order/data/products_repository.dart';
import 'package:auth_module/order/widgets/product_on_cart.dart';
import 'package:auth_module/order/widgets/product_resume.dart';
import 'package:auth_module/order/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Productos',
              style: Theme.of(context).textTheme.headline6,
            ),
            ...ProductsRepository.products.map((product) => ProductWidget(
                  product: product,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'En carrito',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<CartProvider>(builder: (context, cartProvider, widget) {
              if (cartProvider.cart.productsOnCart.isEmpty)
                return Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 50,
                  child: Text(
                    'Nada en carrito',
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                ...cartProvider.cart.productsOnCart
                    .map((product) => ProductOnCartWidget(
                          productOnCartModel: product,
                        )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Resumen',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),

                ...cartProvider.cart.productsOnCart
                    .map((product) => ProductResumeWidget(
                          productOnCartModel: product,
                        )),

                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Spacer(),
                    Text(
                      '\$${cartProvider.cart.total()} MXN',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ]);
            }),
          ],
        ),
      ),
    );
  }
}
