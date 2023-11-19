import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
  });

  Category copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? Uuid().v4(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];

  static List<Category> sampleData = [
    Category(
      id: Uuid().v4(),
      name: 'Fruits',
      description: 'Fresh and juicy fruits',
      imageUrl: 'https://source.unsplash.com/random/?fruit',
    ),
    Category(
      id: Uuid().v4(),
      name: 'Vegetables',
      description: 'Healthy green veggies',
      imageUrl: 'https://source.unsplash.com/random/?vegetable',
    ),
    Category(
      id: Uuid().v4(),
      name: 'Beverages',
      description: 'Refreshing drinks and juices',
      imageUrl: 'https://source.unsplash.com/random/?beverage',
    ),
  ];
}
