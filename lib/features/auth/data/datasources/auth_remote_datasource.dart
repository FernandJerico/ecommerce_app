import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/constants/variables.dart';
import 'package:ecommerce_app/features/auth/data/models/requests/register_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/responses/register_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel data) async {
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/auth/local/register'),
      body: data.toJson(),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return right(RegisterResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
