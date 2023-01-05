//convert the response into non nullable objects
// ignore_for_file: constant_identifier_names
import 'package:udemy_mvvc_course/app/extenstions.dart';
import 'package:udemy_mvvc_course/data/responses/responses.dart';
import '../../domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
      this?.id?.orEmpty() ?? EMPTY,
      this?.name?.orEmpty() ?? EMPTY,
      this?.numOfNotifications?.orZero() ?? ZERO,
    );
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
      this?.email?.orEmpty() ?? EMPTY,
      this?.link?.orEmpty() ?? EMPTY,
      this?.phone?.orEmpty() ?? EMPTY,
    );
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() {
    return Authentication(
      this?.contacts?.toDomain(),
      this?.customer?.toDomain(),
    );
  }
}
