import 'dart:async';

import 'package:iotools/data/model/datasource/local/secure_storage.dart';
import 'package:iotools/data/model/user/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService {
  // Singleton instance
  static final AuthService _instance = AuthService._internal();

  // Private constructor
  AuthService._internal();

  // Factory constructor to return the same instance
  factory AuthService() {
    return _instance;
  }

  final storage = SecureStorage();

  // Current user stream
  final _authStateController = StreamController<User?>.broadcast();
  Stream<User?> get authStateChanges => _authStateController.stream;

  // Current user
  User? _currentUser;
  User? get currentUser => _currentUser;
  bool isAuntificated = false;
  bool? isMaster;

  bool _isMaster(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return decodedToken['isMaster'] as bool;
  }

  Future<void> saveJwt() {
    return Future.delayed(const Duration(seconds: 1));
  }

  Future<void> initializeUser() async {
    try {
      final token = await storage.getToken();
      if (token != null) {
        isAuntificated = true;
      }
    } on Exception catch (e) {
      print('Error while getting jwt in init');
    }
  }

  // Sign in with email and password
  Future<void> signInWithUser(User user, String token) async {
    try {
      _currentUser = user;
      isAuntificated = true;
      _authStateController.add(_currentUser);
      isMaster = _isMaster(token);

      await storage.storeToken(token);
    } catch (e) {
      throw AuthException('Failed to sign in: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      isAuntificated = false;
      _currentUser = null;
      _authStateController.add(null);
      final storage = SecureStorage();
      await storage.deleteToken();
    } catch (e) {
      throw AuthException('Failed to sign out: $e');
    }
  }

  // Listen to auth state changes
  void onAuthStateChanged(void Function(User?) callback) {
    authStateChanges.listen(callback);
  }
}

// Custom exception
class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
