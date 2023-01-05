import 'package:udemy_mvvc_course/data/network/app_api.dart';
import 'package:udemy_mvvc_course/data/request/request.dart';
import 'package:udemy_mvvc_course/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> logic(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;
  RemoteDataSourceImplementer(
    this._appServiceClient,
  );
  @override
  Future<AuthenticationResponse> logic(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.deviceType,
    );
  }
}
