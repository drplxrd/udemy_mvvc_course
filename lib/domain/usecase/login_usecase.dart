import 'package:udemy_mvvc_course/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:udemy_mvvc_course/domain/model/model.dart';
import 'package:udemy_mvvc_course/domain/repository/repository.dart';
import 'package:udemy_mvvc_course/domain/usecase/base_usecase.dart';

import '../../data/request/request.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    await _repository
        .login(LoginRequest(input.email, input.password, "imei", "deviceType"));
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(
    this.email,
    this.password,
  );
}
