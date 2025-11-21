import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/order_cubit.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';
import 'order_summary_page.dart';

class OrderHomePage extends StatefulWidget {
  const OrderHomePage({super.key});

  @override
  State<OrderHomePage> createState() => _OrderHomePageState();
}

class _OrderHomePageState extends State<OrderHomePage> {
  String selectedCategory = "Makanan";

  // Contoh menu (bisa diganti dengan data API/database)
  final List<MenuModel> menuList = [
    MenuModel(
        id: "1",
        name: "Nasi Goreng",
        price: 25000,
        category: "Makanan",
        discount: 0.1),
    MenuModel(
        id: "2",
        name: "Ayam Bakar",
        price: 30000,
        category: "Makanan",
        discount: 0.0),
    MenuModel(
        id: "3",
        name: "Es Teh Manis",
        price: 8000,
        category: "Minuman",
        discount: 0.05),
    MenuModel(
        id: "4",
        name: "Jus Jeruk",
        price: 12000,
        category: "Minuman",
        discount: 0.0),
  ];

  @override
  Widget build(BuildContext context) {
    List<MenuModel> filteredMenu =
        menuList.where((m) => m.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Menu"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Category Selector
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                categoryButton("Makanan"),
                const SizedBox(width: 12),
                categoryButton("Minuman"),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredMenu.length,
              itemBuilder: (context, index) {
                return MenuCard(menu: filteredMenu[index]);
              },
            ),
          )
        ],
      ),

      floatingActionButton: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          int total = context.read<OrderCubit>().getTotalPrice();

          return FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const OrderSummaryPage()),
              );
            },
            label: Text("Total: Rp $total"),
            icon: const Icon(Icons.shopping_cart),
            backgroundColor: Colors.orange,
          );
        },
      ),
    );
  }

  // Button kategori
  Widget categoryButton(String category) {
    bool isActive = selectedCategory == category;
    return GestureDetector(
      onTap: () => setState(() => selectedCategory = category),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? Colors.blueAccent : Colors.grey[300],
        ),
        child: Text(
          category,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
