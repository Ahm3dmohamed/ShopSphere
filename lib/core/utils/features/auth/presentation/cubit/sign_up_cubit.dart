import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:e_comerce_app/core/utils/features/auth/presentation/cubit/sign_up_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final Dio dio;
  SignupCubit({required this.dio}) : super(SignupInitial());

  Future<void> signup({
    required String username,
    required String password,
    required String email,
  }) async {
    emit(SignupLoading());
    try {
      final response = await dio.post(
        'https://dummyjson.com/users/add',
        data: {
          "username": username,
          "password": password,
          "email": email,
        },
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(SignupSuccess());
      } else {
        emit(SignupFailure("Failed to sign up"));
      }
    } catch (e) {
      emit(SignupFailure("Signup error: ${e.toString()}"));
    }
  }
}
