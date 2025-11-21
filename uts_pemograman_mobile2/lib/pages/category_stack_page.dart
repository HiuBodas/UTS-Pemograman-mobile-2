import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/menu_model.dart';
import '../widgets/menu_card.dart';
import '../blocs/category_cubit.dart';

class CategoryStackPage extends StatelessWidget {
  const CategoryStackPage({super.key});

  final List<MenuModel> menus = const [
    MenuModel(
        id: "1", name: "Nasi Goreng", price: 20000, category: "Food", discount: 0.1),
    MenuModel(
        id: "2", name: "Sate Ayam", price: 25000, category: "Food", discount: 0.05),
    MenuModel(
        id: "3", name: "Es Teh", price: 5000, category: "Drink", discount: 0),
    MenuModel(
        id: "4", name: "Jus Alpukat", price: 15000, category: "Drink", discount: 0.2),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CategoryCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Kategori Menu")),
        body: Stack(
          children: [
            // Tombol kategori
            Positioned(
              left: 20,
              top: 20,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return ChoiceChip(
                    label: const Text("Food"),
                    selected: state.selectedCategory == "Food",
                    onSelected: (_) =>
                        context.read<CategoryCubit>().selectCategory("Food"),
                  );
                },
              ),
            ),

            Positioned(
              right: 20,
              top: 20,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  return ChoiceChip(
                    label: const Text("Drink"),
                    selected: state.selectedCategory == "Drink",
                    onSelected: (_) =>
                        context.read<CategoryCubit>().selectCategory("Drink"),
                  );
                },
              ),
            ),

            // List menu berdasarkan kategori aktif
            Container(
              margin: const EdgeInsets.only(top: 70),
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  final filtered = menus
                      .where((m) => m.category == state.selectedCategory)
                      .toList();

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder: (context, index) =>
                        MenuCard(menu: filtered[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
