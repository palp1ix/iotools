import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:iotools/core/constants/constants.dart';
import 'package:iotools/core/service/auth_service.dart';
import 'package:iotools/data/model/company/company.dart';
import 'package:iotools/data/model/metrics/metrics.dart';
import 'package:iotools/data/model/detector/detector.dart';
import 'package:iotools/data/model/room/room.dart';
import 'package:iotools/data/model/sensor_analysis_model/sensor_analysis_model.dart';
import 'package:iotools/data/model/user/user.dart';

class RemoteDatasoure {
  RemoteDatasoure(this.dio);
  final Dio dio;
  final String baseUrl = AppConstants.baseUrl;
  final CookieJar cookieJar = CookieJar();
  final authService = AuthService();

  Future<List<User>> getUsers() async {
    final response = await dio.get('$baseUrl/api/users');
    return (response.data as List).map((e) => User.fromJson(e)).toList();
  }

  Future<List<Room>> getRooms() async {
    final response = await dio.get('$baseUrl/api/rooms');

    return (response.data as List).map((e) => Room.fromJson(e)).toList();
  }

  Future<List<Metrics>> getMetrics() async {
    final response = await dio.get('$baseUrl/api/metrics');

    return (response.data as List).map((e) => Metrics.fromJson(e)).toList();
  }

  Future<Room> createMetrics(Metrics metrics) async {
    final response = await dio.post(
      '$baseUrl/api/metrics',
      data: metrics.toJson(),
    );

    return response.data;
  }

  Future<Room> createRoom(Room room) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/rooms',
        data: room.toJson(),
      );

      return Room.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Detector>> getDetectors() async {
    try {
      final response = await dio.get('$baseUrl/api/detectors');

      return (response.data as List).map((e) => Detector.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<SensorAnalysisModel> getAnalytics(Detector detector) async {
    try {
      final response = await dio.get('$baseUrl/api/detectors/1/analytics');
      return SensorAnalysisModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<User> getUserById(int id) async {
    try {
      final response = await dio.get('$baseUrl/api/users/$id');

      return User.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Detector> createDetector(Detector detector) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/rooms',
        data: detector.toJson(),
      );

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  // ignore: body_might_complete_normally_nullable
  Future<String?> signIn(User user) async {
    try {
      final response = await dio.post(
        '$baseUrl/api/auth/signin',
        data: user.toJson(),
      );

      final token = response.data['accessToken'];

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

  Future<String?> signUp(User user) async {
    print(user.toJson());
    try {
      await dio.post('$baseUrl/api/auth/signup', data: user.toJson());
      final logUser = User(email: user.email, password: user.password);

      final token = await signIn(logUser);
      await authService.signInWithUser(user, token!);
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
