import 'package:auth_module/order/models/actions.dart';

abstract class ProductActions with Actions{

  int incrementCount();
  int decrementCount();
  
}