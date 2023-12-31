import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isPopular;
  final bool isTrending;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    this.isPopular = false,
    this.isTrending = false,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryId,
    bool? isPopular,
    bool? isTrending,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      isPopular: isPopular ?? this.isPopular,
      isTrending: isTrending ?? this.isTrending,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? Uuid().v4(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? '',
      categoryId: json['categoryId'] ?? '',
      isPopular: json['isPopular'] ?? false,
      isTrending: json['isTrending'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'isPopular': isPopular,
      'isTrending': isTrending,
    };
  }

  @override
  List<Object?> get props => [id, name, description, price, imageUrl, categoryId, isPopular, isTrending];

  static List<Product> sampleData = [
    Product(
      id: Uuid().v4(),
      name: 'Banana',
      description: 'A fresh and ripe banana',
      price: 0.99,
      imageUrl: 'https://source.unsplash.com/random/?banana',
      categoryId: '1',
      isPopular: true,
      isTrending: false,
    ),
    // Add more sample products here
  ];
}
