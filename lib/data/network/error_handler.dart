// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';
import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handler(dynamic error) {
    if (error is DioError) {
      //dio error is error from api response

      failure = _handleError(error);
    } else {
      // default errorr

      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();

      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();

      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();

      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();

          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();

          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();

          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();

          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();

          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return Failure(
          ResponseCode.BAD_REQUEST,
          ResponseMessage.BAD_REQUEST,
        );
      case DataSource.FORBIDDEN:
        return Failure(
          ResponseCode.FORBIDDEN,
          ResponseMessage.FORBIDDEN,
        );
      case DataSource.UNAUTHORISED:
        return Failure(
          ResponseCode.UNAUTHORISED,
          ResponseMessage.UNAUTHORISED,
        );
      case DataSource.NOT_FOUND:
        return Failure(
          ResponseCode.NOT_FOUND,
          ResponseMessage.NOT_FOUND,
        );
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(
          ResponseCode.INTERNAL_SERVER_ERROR,
          ResponseMessage.INTERNAL_SERVER_ERROR,
        );
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
          ResponseCode.CONNECT_TIMEOUT,
          ResponseMessage.CONNECT_TIMEOUT,
        );
      case DataSource.CANCEL:
        return Failure(
          ResponseCode.CANCEL,
          ResponseMessage.CANCEL,
        );
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
          ResponseCode.RECEIVE_TIMEOUT,
          ResponseMessage.RECEIVE_TIMEOUT,
        );
      case DataSource.SEND_TIMEOUT:
        return Failure(
          ResponseCode.SEND_TIMEOUT,
          ResponseMessage.SEND_TIMEOUT,
        );
      case DataSource.CACHE_ERROR:
        return Failure(
          ResponseCode.CACHE_ERROR,
          ResponseMessage.CACHE_ERROR,
        );
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(
          ResponseCode.NO_INTERNET_CONNECTION,
          ResponseMessage.NO_INTERNET_CONNECTION,
        );
      case DataSource.DEFAULT:
        return Failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
      default:
        return Failure(
          ResponseCode.DEFAULT,
          ResponseMessage.DEFAULT,
        );
    }
  }
}

class ResponseCode {
  //API STATUS CODES
  static const int SUCCESS = 200; //success with data
  static const int NO_CONTENT = 201; //success with no content
  static const int BAD_REQUEST = 400; //api rejected the request or badrequest
  static const int FORBIDDEN = 403; //api rejected request
  static const int UNAUTHORISED = 401; //credentials unmatched
  static const int NOT_FOUND = 404; //falure to reach the api, or api not found
  static const int INTERNAL_SERVER_ERROR = 500; //server crash or arror

  //LOCAL STATUS CODES
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -5;
  static const int SEND_TIMEOUT = -6;
  static const int CACHE_ERROR = -7;
  static const int NO_INTERNET_CONNECTION = -8;
}

class ResponseMessage {
  //API STATUS CODES
  static const String SUCCESS = "success"; //success with data
  static const String NO_CONTENT =
      "success with no content"; //success with no content
  static const String BAD_REQUEST =
      "Bad request, try again"; //api rejected the request or badrequest
  static const String FORBIDDEN =
      "Forbidden request, try again"; //api rejected request
  static const String UNAUTHORISED =
      "user is unauthenticated, try again"; //credentials unmatched
  static const String NOT_FOUND =
      "Url is not found, try again later"; //falure to reach the api, or api not found
  static const String INTERNAL_SERVER_ERROR =
      "something went wrong"; //server crash or arror

  //LOCAL STATUS CODES
  static const String DEFAULT = "something went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancled, try again later";
  static const String RECEIVE_TIMEOUT = "timeout error, try again later";
  static const String SEND_TIMEOUT = "timeout error, try again later";
  static const String CACHE_ERROR = "cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check your interner connection";
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
