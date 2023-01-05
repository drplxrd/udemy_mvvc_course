// ignore_for_file: constant_identifier_names

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

  //Local status codes
  static const int UNKNOWN = -1;
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

  //Local status codes
  static const String UNKNOWN = "something went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancled, try again later";
  static const String RECEIVE_TIMEOUT = "timeout error, try again later";
  static const String SEND_TIMEOUT = "timeout error, try again later";
  static const String CACHE_ERROR = "cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "please check your interner connection";
}
