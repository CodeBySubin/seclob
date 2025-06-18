class AddressEntity {
  final String country;
  final String state;
  final String district;
  final String city;
  final String zip;

  AddressEntity({
    required this.country,
    required this.state,
    required this.district,
    required this.city,
    required this.zip,
  });
}

class UserEntity {
  final String id;
  final String uniqueId;
  final String name;
  final String email;
  final String phone;
  final String country;
  final AddressEntity address;
  final String createdAt;
  final String updatedAt;

  UserEntity({
    required this.id,
    required this.uniqueId,
    required this.name,
    required this.email,
    required this.phone,
    required this.country,
    required this.address,
    required this.createdAt,
    required this.updatedAt,
  });
}
