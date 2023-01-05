import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:udemy_mvvc_course/app/constants.dart';
import 'package:udemy_mvvc_course/data/responses/responses.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  );
}

class _AppServiceClient implements AppServiceClient {
  final Dio _dio;
  final String? baseUrl;

  _AppServiceClient(this._dio, {this.baseUrl});

  @override
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  ) async {
    final response = await _dio.post("$baseUrl/customers/login");
    return response.data;
  }
}
