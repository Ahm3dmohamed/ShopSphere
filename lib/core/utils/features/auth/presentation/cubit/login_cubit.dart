import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Dio dio = Dio();

  void login(String username, String password) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailure("An error occurred: ${e.toString()}"));
    }
  }
}
