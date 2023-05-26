import 'CountryModel.dart';

class PromoterModel {
  final String? id;
  final CountryModel? countryModel;
  final String? name;
  final String? nickname;
  final String? email;
  final String? password;
  final String? company;
  final String? avatarUrl;
  final int? age;
  final String? phone;
  String? cityName;
  final String? street;
  final String? postCode;
  final String? contact;

  PromoterModel({
    this.id,
    this.countryModel,
    this.name,
    this.nickname,
    this.email,
    this.password,
    this.company,
    this.avatarUrl,
    this.age,
    this.phone,
    this.cityName,
    this.street,
    this.postCode,
    this.contact,
  });

  factory PromoterModel.fromJson(Map<String, dynamic> json) {
    return PromoterModel(
      id: json['_id'],
      countryModel: CountryModel.fromJson(json['countryModel']),
      name: json['name'],
      nickname: json['nickname'],
      email: json['email'],
      password: json['password'],
      company: json['company'],
      avatarUrl: json['avatarUrl'],
      age: json['age'],
      phone: json['phone'],
      cityName: json['cityName'],
      street: json['street'],
      postCode: json['post_code'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'company': company,
      'avatarUrl': avatarUrl,
      'age': age,
      'phone': phone,
      'cityName': cityName,
      'street': street,
      'post_code': postCode,
      'contact': contact,
    };
  }
}
