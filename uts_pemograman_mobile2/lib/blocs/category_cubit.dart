import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class CategoryState extends Equatable {
  final String selectedCategory;

  const CategoryState(this.selectedCategory);

  @override
  List<Object?> get props => [selectedCategory];
}

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(const CategoryState("Food"));

  void selectCategory(String category) {
    emit(CategoryState(category));
  }
}
