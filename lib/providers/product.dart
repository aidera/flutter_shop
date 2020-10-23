import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// Provider сделан из модели. В данном примере будет демонстрироваться подключение
// провайдера к списку, у каждого элемента которого будет свой экземляр провайдера.
// Конечно, в реальной жизни такое лучше не делать. Но как вариант.
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    try {
      final url = 'https://learning-473b5.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';
      await http.put(url, body: json.encode(isFavorite));
    } catch (error) {
      isFavorite = oldStatus;
      notifyListeners();
    }

  }
}
