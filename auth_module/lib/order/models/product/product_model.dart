class Product {
  String name;
  double price;

  Product({required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json)=> Product(
    name: json["name"], 
    price: (json["price"] as num).toDouble() 
  );

}