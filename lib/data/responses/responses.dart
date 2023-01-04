class BaseResponse {
  int? status;
  String? message;
}

class CustomerResponse {
  String? id;
  String? name;
  int? numOfNotifications;

  CustomerResponse(this.id, this.name, this.numOfNotifications);

// from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      CustomerResponse(
        json["id"] as String,
        json["name"] as String,
        json["numOfNotifications"] as int,
      );

// to json
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "numOfNotifications": numOfNotifications,
      };
}

class ContactsResponse {
  String? email;
  String? phone;
  String? link;

  ContactsResponse(this.email, this.phone, this.link);

// from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      ContactsResponse(
        json["email"] as String,
        json["phone"] as String,
        json["link"] as String,
      );

// to json
  Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
        "link": link,
      };
}

class AuthenticationResponse extends BaseResponse {
  CustomerResponse? customer;
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer, this.contacts);

// from json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json) =>
      AuthenticationResponse(CustomerResponse.fromJson(json["customer"]),
          ContactsResponse.fromJson(json["contacts"]));

// to json
  Map<String, dynamic> toJson() => {
        "customer": customer!.toJson(),
        "contacts": contacts!.toJson(),
      };
}
