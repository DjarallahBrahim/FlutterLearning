import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product.dart';

class Products with ChangeNotifier {
  final String authToken;
  final String userId;
  Products(this.authToken, this.userId, this._items);

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

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    var params = filterByUser
        ? {
            'auth': authToken,
            'orderBy': '"author"',
            'equalTo': '"$userId"',
          }
        : {
            'auth': authToken,
          };
    final url = Uri.https('flutter-shop-faa15-default-rtdb.firebaseio.com',
        '/products.json', params);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final urlFavorite = Uri.https(
          'flutter-shop-faa15-default-rtdb.firebaseio.com',
          '/userFavorites/$userId.json',
          {'auth': '$authToken'});
      final favoriteReponse = await http.get(urlFavorite);
      final favoriteData = json.decode(favoriteReponse.body);

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodcutId, prodData) {
        loadedProducts.add(Product(
            id: prodcutId.toString(),
            title: prodData['title'],
            description: prodData['description'],
            price: prodData['price'],
            isFavorite:
                favoriteData == null ? false : favoriteData[prodcutId] ?? false,
            imageUrl: prodData['imageUrl']));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product p) async {
    final url = Uri.https('flutter-shop-faa15-default-rtdb.firebaseio.com',
        '/products.json', {'auth': '$authToken'});
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'description': p.description,
            'price': p.price,
            'title': p.title,
            'imageUrl': p.imageUrl,
            'id': DateTime.now().toString(),
            'author': userId
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
          '/products/${p.id}.json', {'auth': '$authToken'});
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
        '/products/${id}.json', {'auth': '$authToken'});
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
