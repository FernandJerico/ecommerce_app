import 'package:ecommerce_app/config/extensions/int_ext.dart';

class Product {
  final List<String> images;
  final String name;
  final int price;

  Product({required this.images, required this.name, required this.price});

  String get priceFormat => price.currencyFormatRp;
}
