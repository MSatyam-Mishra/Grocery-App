import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CartItem extends Equatable {
  final String id;
  final Map<String, dynamic> product;
  final int quantity;
  final double subtotal;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
    required this.subtotal,
  });

  CartItem copyWith({
    String? id,
    Map<String, dynamic>? product,
    int? quantity,
    double? subtotal,
  }) {
    return CartItem(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      subtotal: subtotal ?? this.subtotal,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] ?? Uuid().v4(),
      product: json['product'] ?? {},
      quantity: json['quantity'] ?? 0,
      subtotal: json['subtotal']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }

  @override
  List<Object?> get props => [id, product, quantity, subtotal];

  static List<CartItem> sampleData = [
    CartItem(
      id: Uuid().v4(),
      product: {
        'name': 'Sneakers',
        'price': 79.99,
        'image': 'https://source.unsplash.com/random/?shoes',
      },
      quantity: 2,
      subtotal: 159.98,
    ),
    CartItem(
      id: Uuid().v4(),
      product: {
        'name': 'Backpack',
        'price': 49.99,
        'image': 'https://source.unsplash.com/random/?backpack',
      },
      quantity: 1,
      subtotal: 49.99,
    ),
  ];
}
