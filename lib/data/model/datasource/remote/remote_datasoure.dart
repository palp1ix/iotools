import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:iotools/core/constants/constants.dart';
import 'package:iotools/core/service/auth_service.dart';
import 'package:iotools/data/model/company/company.dart';
import 'package:iotools/data/model/room/room.dart';
import 'package:iotools/data/model/user/user.dart';

class RemoteDatasoure {
  RemoteDatasoure(this.dio);
  final Dio dio;
  final String baseUrl = AppConstants.baseUrl;
  final CookieJar cookieJar = CookieJar();
  final authService = AuthService();

  Future<List<Room>> getDevice() async {
    final response = await dio.get('$baseUrl/api/rooms');

    return (response.data as List).map((e) => Room.fromJson(e)).toList();
  }

  Future<String?> signIn(User user) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/auth/signin',
        data: user.toJson(),
      );

      final token = response.data.toString();

      if (token.isNotEmpty) {
        dio.options.headers['Authorization'] = 'Bearer $token';
      }

      await authService.signInWithUser(user, token);

      return token;
    } on DioException catch (e) {
      print(e.response?.statusCode);
      print(e.message);
      rethrow;
    } catch (e) {
      print(e);
    }
  }

  Future<String> signUp(User user) async {
    print(user.toJson());
    try {
      final response = await dio.post(
        '$baseUrl/api/auth/signup',
        data: user.toJson(),
      );
      await authService.signInWithUser(user, response.data);
      return response.data;
    } on DioException catch (e) {
      print(e.response?.statusCode.toString());
      print(e.error);
      print(e.message);
      rethrow;
    }
  }

  Future<int> getCompanyId(int code) async {
    try {
      final response = await dio.get('$baseUrl/api/companies/$code');
      final company = Company.fromJson(response.data);
      return company.id;
    } on DioException catch (e) {
      print(e.response?.statusCode.toString());
      print(e.error);
      print(e.message);
      rethrow;
    }
  }
}
