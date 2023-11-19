import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'cart_item.dart';

class Cart extends Equatable {
  final String userId;
  final List<CartItem> cartItems;

  Cart({required this.userId, required this.cartItems});

  int get totalQuantity => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get totalPrice => cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  Cart copyWith({String? userId, List<CartItem>? cartItems}) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      userId: json['userId'] ?? '',
      cartItems: (json['cartItems'] as List).map((item) => CartItem.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cartItems': cartItems.map((item) => item.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [userId, cartItems];

  static List<Cart> sampleData = [
    Cart(
      userId: Uuid().v4(),
      cartItems: [
        CartItem(
          id: Uuid().v4(),
          title: 'Sample Product 1',
          quantity: 2,
          price: 9.99,
          imageUrl: 'https://source.unsplash.com/random/?product',
        ),
        CartItem(
          id: Uuid().v4(),
          title: 'Sample Product 2',
          quantity: 1,
          price: 19.99,
          imageUrl: 'https://source.unsplash.com/random/?gadget',
        ),
      ],
    ),
  ];
}
