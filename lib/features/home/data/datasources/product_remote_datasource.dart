import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/home/data/model/responses/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDatasource {
  Future<Either<String, ProductsResponseModel>> getAllProduct() async {
    final response = await http.get(Uri.parse('uri'));
    if (response.statusCode == 200) {
      return Right(ProductsResponseModel.fromJson(response.body));
    } else {
      return const Left('Server Error');
    }
  }
}
