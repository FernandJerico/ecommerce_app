import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/config/constants/variables.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/cost_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/province_response_model.dart';
import 'package:ecommerce_app/features/shipping/data/model/response/subdiscrict_response_model.dart';
import 'package:http/http.dart' as http;

import '../model/response/city_response_model.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(
      url,
      headers: {'key': Variables.rajaOngkirKey},
    );
    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, CityResponseModel>> getCities(String provinceId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {'key': Variables.rajaOngkirKey},
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, SubDistrictResponseModel>> getSubDistrict(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {'key': Variables.rajaOngkirKey},
    );
    if (response.statusCode == 200) {
      return right(SubDistrictResponseModel.fromJson(response.body));
    } else {
      return left('Server Error');
    }
  }

  Future<Either<String, CostResponseModel>> getCost(
    String origin,
    String destination,
    String courier,
  ) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
        'content-type': 'application/x-www-form-urlencoded',
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': '500',
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  // Future<Either<WaybillFailedResponseModel, WaybillSuccessResponseModel>>
  //     getWayBill(
  //   String waybill,
  //   String courier,
  // ) async {
  //   final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'key': Variables.rajaOngkirKey,
  //       'content-type': 'application/x-www-form-urlencoded',
  //     },
  //     body: {
  //       'waybill': waybill,
  //       'courier': courier,
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     return right(WaybillSuccessResponseModel.fromJson(response.body));
  //   } else {
  //     return left(WaybillFailedResponseModel.fromJson(response.body));
  // }
  // }
}
