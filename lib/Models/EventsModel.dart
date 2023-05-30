import 'package:events_app/Models/ArtistsModel.dart';
import 'package:events_app/Models/CountryModel.dart';

class EventModel {
  final String? id;
  final String? title;
  final String? bannerUrl;
  final List<String>? photoGallery;
  final CountryModel? country;
  final String? cityId;
  final String? cityName;
  final String? street;
  final String? number;
  final String? placeName;
  final String? description;
  final double? entrancePrice;
  final String? organizedBy;
  final bool? forAdultsOnly;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final String? paymentInfo;
  final DateTime? created;
  final DateTime? updated;
  final String? promoter;
  final ArtistsModel? artists;
  final List<String>? likes;
  final int? likesCount;

  EventModel({
    this.id,
    this.title,
    this.bannerUrl,
    this.photoGallery,
    this.country,
    this.cityId,
    this.cityName,
    this.street,
    this.number,
    this.placeName,
    this.description,
    this.entrancePrice,
    this.organizedBy,
    this.forAdultsOnly,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.paymentInfo,
    this.created,
    this.updated,
    this.promoter,
    this.artists,
    this.likes,
    this.likesCount,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'],
      title: json['title'],
      bannerUrl: json['bannerUrl'],
      photoGallery: List<String>.from(json['photoGallery']),
      country: CountryModel.fromJson(json['country']),
      cityId: json['cityId']['_id'],
      cityName: json['cityName'],
      street: json['street'],
      number: json['number'],
      placeName: json['place_name'],
      description: json['description'],
      entrancePrice: json['entrance_price'].toDouble(),
      organizedBy: json['organized_by'],
      forAdultsOnly: json['for_adults_only'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      paymentInfo: json['paymentInfo'],
      created: DateTime.parse(json['created']),
      updated: DateTime.parse(json['updated']),
      promoter: json['promoter'],
      artists: ArtistsModel.fromJson(json['artists']),
      likes: List<String>.from(json['likes']),
      likesCount: json['likesCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'bannerUrl': bannerUrl,
      'photoGallery': photoGallery,
      'country': country!.toJson(),
      'cityId': {'_id': cityId},
      'cityName': cityName,
      'street': street,
      'number': number,
      'place_name': placeName,
      'description': description,
      'entrance_price': entrancePrice,
      'organized_by': organizedBy,
      'for_adults_only': forAdultsOnly,
      'start_date': startDate!,
      'end_date': endDate!,
      'start_time': startTime,
      'end_time': endTime,
      'paymentInfo': paymentInfo,
      'created': created!.toIso8601String(),
      'updated': updated!.toIso8601String(),
      'promoter': promoter,
      'artists': artists!.toJson(),
      'likes': likes,
      'likesCount': likesCount,
    };
  }
}
