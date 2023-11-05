import 'package:ecommerce_app/features/auth/data/models/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<void> saveAuthData(AuthResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth', model.toJson());
  }

  Future<void> removeAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth');
  }

  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.jwt ?? '';
  }

  Future<User> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(authJson);
    return authData.user!;
  }

  Future<bool> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    return authJson.isNotEmpty;
  }
}
