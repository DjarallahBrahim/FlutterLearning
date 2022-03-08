import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/exceptions/http_exception.dart';

class Auth with ChangeNotifier {
  String _token = '';
  DateTime _expiryDate = DateTime.now();
  String _userId = '';

  final urlSegmentSingup = 'signUp?key=AIzaSyDgx_KuLnMRqOlz7uisEzX2JkBGc9eR3D4';
  final urlSegmentLogin =
      'signInWithPassword?key=AIzaSyDgx_KuLnMRqOlz7uisEzX2JkBGc9eR3D4';

  bool get isAuth {
    return token.isNotEmpty;
  }

  String get userUd {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    } else
      return '';
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, urlSegmentSingup);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, urlSegmentLogin);
  }

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment');
    try {
      final response = await http.post(url,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
      final prefes = await SharedPreferences.getInstance();
      final userData = json.encode({
        'token': _token,
        'userId': _userId,
        'expiryDate': _expiryDate.toIso8601String()
      });
      prefes.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutologin() async {
    final prefes = await SharedPreferences.getInstance();
    if (!prefes.containsKey('userData')) {
      return false;
    } else {
      final String usereData = prefes.get('userData') as String;
      final extractedUserData = json.decode(usereData) as Map<String, dynamic>;
      final exiryDate = DateTime.parse(extractedUserData['expiryDate']);
      if (exiryDate != null && exiryDate.isBefore(DateTime.now())) {
        return false;
      } else {
        _token = extractedUserData['token'];
        _userId = extractedUserData['userId'];
        _expiryDate = exiryDate;
        notifyListeners();
        return true;
      }
    }
  }

  Future<void> logout() async {
    _token = '';
    _userId = '';
    _expiryDate = DateTime.now();
    final prefes = await SharedPreferences.getInstance();
    prefes.remove('userData');

    notifyListeners();
  }
}
