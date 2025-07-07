import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

import 'package:dio/dio.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Dio dio = Dio();

  void login(String username, String password) async {
    emit(LoginLoading());
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30,
        },
      );
      if (response.statusCode == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid credentials"));
      }
    } catch (e) {
      emit(LoginFailure("An error occurred"));
    }
  }
}

// fetch('https://dummyjson.com/auth/login', {
//   method: 'POST',
//   headers: { 'Content-Type': 'application/json' },
//   body: JSON.stringify({
    
//     username: 'emilys',
//     password: 'emilyspass',
//     expiresInMins: 30, // optional, defaults to 60
//   }),
//   credentials: 'include' // Include cookies (e.g., accessToken) in the request
// })
// .then(res => res.json())
// .then(console.log);
