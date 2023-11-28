import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/constants/variables.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:ecommerce_app/features/cart/data/model/request/order_request_model.dart';
import 'package:ecommerce_app/features/cart/data/model/response/order_detail_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/request/add_address_request_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/add_address_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/get_address_response_model.dart';
import 'package:http/http.dart' as http;

import '../model/response/buyer_order_response_model.dart';
import '../model/response/order_response_model.dart';

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel request) async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return right(OrderResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, OrderDetailResponseModel>> getOrderById(
      String id) async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/orders/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(OrderDetailResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, AddAddressResponseModel>> addAddress(
      AddAddressRequestModel request) async {
    final token = await AuthLocalDatasource().getToken();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/addresses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: request.toJson(),
    );

    if (response.statusCode == 200) {
      return right(AddAddressResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, GetAddressResponseModel>> getAddressByUserId() async {
    final token = await AuthLocalDatasource().getToken();
    final user = await AuthLocalDatasource().getUser();
    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/addresses?filters[user_id][\$eq]=${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(GetAddressResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, BuyerOrderResponseModel>> getOrderByUserId() async {
    final token = await AuthLocalDatasource().getToken();
    final user = await AuthLocalDatasource().getUser();
    final response = await http.get(
      Uri.parse(
          '${Variables.baseUrl}/api/orders?filters[buyerId][\$eq]=${user.id}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return right(BuyerOrderResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }
}
