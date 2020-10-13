import 'package:flutter/foundation.dart';


// Provider сделан из модели. В данном примере будет демонстрироваться подключение
// провайдера к списку, у каждого элемента которого будет свой экземляр провайдера.
// Конечно, в реальной жизни такое лучше не делать. Но как вариант.
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavoriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
