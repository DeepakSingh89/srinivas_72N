import 'address.dart';

class AddAddressParams {
  Address? address;

  AddAddressParams({this.address});

  factory AddAddressParams.fromJson(Map<String, dynamic> json) {
    return AddAddressParams(
      address: json['Address'] == null
          ? null
          : Address.fromJson(json['Address'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'Address': address?.toJson(),
      };
}
