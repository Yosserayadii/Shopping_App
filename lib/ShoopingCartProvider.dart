import 'package:flutter/foundation.dart';
import 'package:shoppingproj/Models/ShoopingItem.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<ShoppingItem> _cartItems = [];

  List<ShoppingItem> get cartItems => _cartItems;

  void addToCart(ShoppingItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(ShoppingItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }
}
