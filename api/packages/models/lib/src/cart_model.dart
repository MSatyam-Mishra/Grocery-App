import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'cart_item.dart';
import 'product.dart';

class Cart extends Equatable {
  final String userId;
  final List<CartItem> cartItems;

  Cart({
    required this.userId,
    required this.cartItems,
  });

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItems,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  int get totalQuantity =>
      cartItems.fold(0, (total, item) => total + item.quantity);

  double get totalPrice =>
      cartItems.fold(0, (total, item) => total + item.subtotal);

  @override
  List<Object> get props => [userId, cartItems];

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        userId: json['userId'] ?? '',
        cartItems: (json['cartItems'] as List)
            .map((i) => CartItem.fromJson(i))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'cartItems': cartItems.map((item) => item.toJson()).toList(),
      };

  static List<Cart> sampleData = [
    Cart(
      userId: Uuid().v4(),
      cartItems: [
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            description:
                'The banana, nature\'s energy bar, is a versatile and nutritious fruit that comes neatly packaged in its own biodegradable wrapper. with a naturally sweet taste and a creamy texture, bananas provide a quick and convenient source of energy. Packed with essential vitamins, minerals, and dietary fiber, bananas are a wholesome snack enjoyed worldwide. Whether sliced on top of cereal, blended into creamy shakes, or simply peeled and eaten on the go, bananas are a delicious and nutritious addition to a balanced diet.',
            name: 'Banana',
            price: 1.99,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?banana',
          ),
          quantity: 5,
          subtotal: 9.95,
        ),
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            description:
                'The mango, often hailed as the "King of Fruits," is a tropical delight renowned for its rich, sweet flavor and succulent texture. With its vibrant hues of yellow and orange, the mango entices the senses and offers a juicy, tropical escape. Whether enjoyed fresh, sliced, or blended into refreshing smoothies, the mango is a symbol of indulgence and tropical paradise.',
            name: 'Mango',
            price: 0.99,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?mango',
          ),
          quantity: 3,
          subtotal: 2.97,
        ),
      ],
    ),
    Cart(
      userId: Uuid().v4(),
      cartItems: [
        CartItem(
          id: Uuid().v4(),
          product: Product(
            id: Uuid().v4(),
            name: 'Banana',
            description: 'A delicious banana.',
            price: 0.69,
            categoryId: '1',
            imageUrl: 'https://source.unsplash.com/random/?banana',
          ),
          quantity: 10,
          subtotal: 6.9,
        ),
      ],
    ),
  ];
}
