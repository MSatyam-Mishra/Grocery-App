import 'package:equatable/equatable.dart';

import 'package:models/src/product.dart';
import 'package:uuid/uuid.dart';

class CartItem extends Equatable {
  final String id;
  final Product product;
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
    Product? product,
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
      product: Product.sampleData[0],
      quantity: 2,
      subtotal: Product.sampleData[0].price,
    ),
    CartItem(
      id: Uuid().v4(),
      product: Product.sampleData[1],
      quantity: 1,
      subtotal: Product.sampleData[1].price,
    ),
  ];
}
