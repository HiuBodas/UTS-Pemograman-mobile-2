import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/menu_model.dart';

class OrderState extends Equatable {
  final Map<MenuModel, int> items;

  const OrderState({required this.items});

  OrderState copyWith({Map<MenuModel, int>? items}) {
    return OrderState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(const OrderState(items: {}));

  // Tambah item ke pesanan
  void addToOrder(MenuModel menu) {
    final updated = Map<MenuModel, int>.from(state.items);
    updated[menu] = (updated[menu] ?? 0) + 1;

    emit(state.copyWith(items: updated));
  }

  // Hapus menu dari pesanan
  void removeFromOrder(MenuModel menu) {
    final updated = Map<MenuModel, int>.from(state.items);
    updated.remove(menu);

    emit(state.copyWith(items: updated));
  }

  // Update kuantitas menu
  void updateQuantity(MenuModel menu, int qty) {
    final updated = Map<MenuModel, int>.from(state.items);

    if (qty <= 0) {
      updated.remove(menu);
    } else {
      updated[menu] = qty;
    }

    emit(state.copyWith(items: updated));
  }

  // Hitung total harga setelah diskon tiap menu
  int getTotalPrice() {
    int total = 0;
    state.items.forEach((menu, qty) {
      total += menu.getDiscountedPrice() * qty;
    });
    return total;
  }

  // Hapus semua pesanan
  void clearOrder() {
    emit(const OrderState(items: {}));
  }
}
