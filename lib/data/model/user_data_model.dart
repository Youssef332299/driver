class UserDataModel {
  String? name;
  String? image;
  String? email;
  String? password;
  String? street;
  String? city;
  String? district;

  UserDataModel(
      {required this.name,
      required this.image,
      required this.city,
      required this.email,
      required this.district,
      required this.password,
      required this.street,
      });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'city': city,
      'email': email,
      'district': district,
      'street': street,
      'password': password,
    };
  }
}
