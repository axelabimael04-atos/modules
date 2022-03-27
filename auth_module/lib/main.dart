import 'package:auth_module/auth/src/auth_page.dart';
import 'package:auth_module/order/data/cart_provider.dart';
import 'package:auth_module/order/src/cart_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: CartPage(),
      // home: AuthPage(
      //   key: Key('auth-page'),
      // ),
    );
  }
}


