import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product.dart';

class Products with ChangeNotifier {
  final url = Uri.https(
      'flutter-shop-faa15-default-rtdb.firebaseio.com', '/products.json');
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((productElement) => productElement.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      extractedData.forEach((prodcutId, prodData) {
        loadedProducts.add(Product(
            id: prodcutId,
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            isFavorite: prodData['isFavorite'],
            imageUrl: prodData['imageUrl']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product p) async {
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'description': p.description,
            'price': p.price,
            'title': p.title,
            'imageUrl': p.imageUrl,
            'isFavorite': p.isFavorite,
            'id': DateTime.now().toString()
          },
        ),
      );
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: p.title,
          description: p.description,
          price: p.price,
          imageUrl: p.imageUrl);
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateProduct(Product p) async {
    final prodIndex = _items.indexWhere((element) => element.id == p.id);

    if (prodIndex >= 0) {
      final url = Uri.https('flutter-shop-faa15-default-rtdb.firebaseio.com',
          '/products/${p.id}.json');
      await http.patch(url,
          body: json.encode({
            'description': p.description,
            'price': p.price,
            'title': p.title,
            'imageUrl': p.imageUrl,
            'id': DateTime.now().toString()
          }));

      _items[prodIndex] = p;
      notifyListeners();
    }
  }

  Future<void> deleteById(String id) async {
    final url = Uri.https('flutter-shop-faa15-default-rtdb.firebaseio.com',
        '/products/${id}.json');
    final exisitingProductIndex =
        _items.indexWhere((element) => element.id == id);
    final exisitingProduct = _items.firstWhere((element) => element.id == id);
    _items.removeAt(exisitingProductIndex);
    notifyListeners();
    http.delete(url).then((reponse) {
      if (reponse.statusCode >= 400) {
        throw Exception();
      }
    }).catchError((_) {
      _items.insert(exisitingProductIndex, exisitingProduct);
      notifyListeners();
    });
  }
}
