import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';
import '../models/menu_model.dart';

class OrderSummaryPage extends StatelessWidget {
  const OrderSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan Pesanan")),
      body: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final total = context.read<OrderCubit>().getTotalPrice();
          final bool applyDiscount = total > 100000;
          final int discountAmount =
              applyDiscount ? (total * 0.10).toInt() : 0;
          final int finalTotal = total - discountAmount;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Detail Pesanan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Daftar pesanan
                Expanded(
                  child: ListView(
                    children: state.items.entries.map((entry) {
                      MenuModel menu = entry.key;
                      int qty = entry.value;

                      return ListTile(
                        title: Text(menu.name),
                        subtitle: Text("Qty: $qty"),
                        trailing: Text(
                          "Rp ${menu.getDiscountedPrice() * qty}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                const Divider(),

                // Perhitungan total
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Awal: Rp $total"),

                    if (applyDiscount)
                      Text(
                        "Diskon 10%: -Rp $discountAmount",
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    const SizedBox(height: 6),

                    Text(
                      "Total Bayar: Rp $finalTotal",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                ElevatedButton(
                  onPressed: () {
                    context.read<OrderCubit>().clearOrder();
                    Navigator.pop(context);
                  },
                  child: const Text("Selesai"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
