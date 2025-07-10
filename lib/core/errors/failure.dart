import 'package:dio/dio.dart';

abstract class Failures {
  final String errorMessage;
  Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with apiserver");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with apiserver");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout with apiserver");
      case DioExceptionType.badCertificate:
        return ServerFailure("Invalid Certifacate with apiserver");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Your request was cancled');
      case DioExceptionType.connectionError:
        return ServerFailure('Connection error broo');
      case DioExceptionType.unknown:
        if (dioError.message!.contains("Socket Exception")) {
          return ServerFailure("No Internet Connection! ");
        }
        return ServerFailure("UnExpected Error!,Try Again");
      default:
        return ServerFailure('Oops,there is an error,Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int? stausCode, dynamic response) {
    if (stausCode == 400 || stausCode == 401 || stausCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (stausCode == 404) {
      return ServerFailure('Your request not found ,Please try later!');
    } else if (stausCode == 500) {
      return ServerFailure('Internal server error ,Please try later!');
    } else {
      return ServerFailure('Oops,there is an error,Please try again!');
    }
  }
}
