import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
      case DioErrorType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioErrorType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioErrorType.connectionError:
        return ServerFailure('No Internet connection');
      case DioErrorType.unknown:
        return ServerFailure('|Unexpected Error, Please try later!');
      default:
        return ServerFailure('Oops there was an error , Please try again');
    }
  }
  factory ServerFailure.fromResponse(dynamic statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not Found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server Error, Please try later ');
    } else {
      return ServerFailure('Opps there was an Error , Please try again');
    }
  }
}
