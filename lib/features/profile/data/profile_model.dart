import 'package:seclob/features/profile/domain/entities.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    required super.country,
    required super.state,
    required super.district,
    required super.city,
    required super.zip,
  });

  factory AddressModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return AddressModel(
        country: '',
        state: '',
        district: '',
        city: '',
        zip: '',
      );
    }

    return AddressModel(
      country: json['country'] ?? '',
      state: json['state'] ?? '',
      district: json['district'] ?? '',
      city: json['city'] ?? '',
      zip: json['zip'] ?? '',
    );
  }
}

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.uniqueId,
    required super.name,
    required super.email,
    required super.phone,
    required super.country,
    required super.address,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      uniqueId: json['unique_id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      country: json['country'] ?? '',
      address: AddressModel.fromJson(json['address']),
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
