// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

class MenuModel extends Equatable {
  final String id;
  final String name;
  final int price;
  final String category;
  final double discount; // 0–1

  const MenuModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    this.discount = 0,
  });

  int getDiscountedPrice() {
    return (price - (price * discount)).toInt();
  }

  MenuModel copyWith({
    String? id,
    String? name,
    int? price,
    String? category,
    double? discount,
  }) {
    return MenuModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      category: category ?? this.category,
      discount: discount ?? this.discount,
    );
  }

  @override
  List<Object?> get props => [id, name, price, category, discount];
}
