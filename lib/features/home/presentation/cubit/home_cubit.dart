// lib/features/home/presentation/cubit/home_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../../domain/entities/product_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<ProductEntity> products;
  HomeSuccess(this.products);
}

class HomeFailure extends HomeState {
  final String message;
  HomeFailure(this.message);
}

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProductsUseCase;

  HomeCubit({required this.getProductsUseCase}) : super(HomeInitial());

  Future<void> getProducts() async {
    emit(HomeLoading());
    try {
      final products = await getProductsUseCase.call();
      emit(HomeSuccess(products));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
