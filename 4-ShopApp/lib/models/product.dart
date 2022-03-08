import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String authToken, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;

    final url = Uri.https('flutter-shop-faa15-default-rtdb.firebaseio.com',
        '/userFavorites/$userId/$id.json', {'auth': '$authToken'});
    try {
      await http.put(url, body: json.encode(isFavorite));
    } catch (error) {
      isFavorite = oldStatus;
      throw error;
    }
    notifyListeners();
  }
}
