import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'product_state.dart';
//  fetch('https://dummyjson.com/products')

class ProductCubit extends Cubit<ProductState> {
  Dio dio;
  ProductCubit({required this.dio}) : super(ProductInitial());
  getProduct() async {
    try {
      var responce = await dio.post("https://dummyjson.com/products");
    } catch (e) {}
  }
}
