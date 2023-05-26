import 'package:events_app/Models/PromoterModel.dart';

class ModelCity {
  String? id;
  String? cityName;
  String? capital;

  List<PromoterModel>? tblPromoters;

  ModelCity({this.id, this.cityName, this.capital, this.tblPromoters});

  ModelCity.fromJson(Map<String, dynamic> json) {
    cityName = json['cityName'];
    capital = json['capital'];
    id = json['id'];
    if (json['tblUsers'] != null) {
      tblPromoters = <PromoterModel>[];
      json['tblUsers'].forEach((v) {
        tblPromoters!.add(new PromoterModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityName'] = this.cityName;
    data['capital'] = this.capital;
    if (this.tblPromoters != null) {
      data['tblUsers'] = this.tblPromoters!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
