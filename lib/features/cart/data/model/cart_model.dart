// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/config/extensions/string_ext.dart';
import 'package:ecommerce_app/features/home/data/model/responses/products_response_model.dart';

class Cart {
  final Product product;
  int qty;

  Cart({
    required this.product,
    this.qty = 0,
  });

  String get priceFormat => product.attributes.price.currencyFormatRp;
}
