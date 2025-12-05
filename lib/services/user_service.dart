import 'dart:convert';
import 'package:my_mvvm/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _userKey = 'user_data';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  // Singleton pattern
  static final UserService _instance = UserService._internal();
  factory UserService() => _instance;
  UserService._internal();

  SharedPreferences? _prefs;
  User? _currentUser;

  // Initialize SharedPreferences
  Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  // Save user session after login
  Future<bool> saveUser(User user) async {
    await init();
    try {
      await _prefs!.setString(_userKey, userToJson(user));
      await _prefs!.setString(_accessTokenKey, user.access ?? '');
      await _prefs!.setString(_refreshTokenKey, user.refresh ?? '');
      _currentUser = user;
      return true;
    } catch (e) {
      print('Error saving user: $e');
      return false;
    }
  }

  // Get current user from memory or SharedPreferences
  Future<User?> getUser() async {
    if (_currentUser != null) return _currentUser;

    await init();
    final userJson = _prefs!.getString(_userKey);
    if (userJson != null) {
      _currentUser = userFromJson(userJson);
      return _currentUser;
    }
    return null;
  }

  // Get access token
  Future<String?> getAccessToken() async {
    await init();
    return _prefs!.getString(_accessTokenKey);
  }

  // Get refresh token
  Future<String?> getRefreshToken() async {
    await init();
    return _prefs!.getString(_refreshTokenKey);
  }

  // Update access token (after refresh)
  Future<bool> updateAccessToken(String newAccessToken) async {
    await init();
    try {
      await _prefs!.setString(_accessTokenKey, newAccessToken);
      if (_currentUser != null) {
        _currentUser!.access = newAccessToken;
        await _prefs!.setString(_userKey, userToJson(_currentUser!));
      }
      return true;
    } catch (e) {
      print('Error updating access token: $e');
      return false;
    }
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    await init();
    return _prefs!.containsKey(_userKey);
  }

  // Clear user session (logout)
  Future<bool> clearUser() async {
    await init();
    try {
      await _prefs!.remove(_userKey);
      await _prefs!.remove(_accessTokenKey);
      await _prefs!.remove(_refreshTokenKey);
      _currentUser = null;
      return true;
    } catch (e) {
      print('Error clearing user: $e');
      return false;
    }
  }

  // Get current user synchronously (if already loaded)
  User? get currentUser => _currentUser;

  // Get user ID
  Future<num?> getUserId() async {
    final user = await getUser();
    return user?.id;
  }

  // Get user name
  Future<String?> getUserName() async {
    final user = await getUser();
    return user?.name;
  }

  // Get user email
  Future<String?> getUserEmail() async {
    final user = await getUser();
    return user?.email;
  }
}
