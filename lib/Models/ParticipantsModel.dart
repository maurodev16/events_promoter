class ModelParticipants {
  int? userId;
  int? partyId;
  String? name;
  bool? isConfirmed;

  ModelParticipants({this.userId, this.partyId, this.name, this.isConfirmed});

  ModelParticipants.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    partyId = json['partyId'];
    name = json['name'];
    isConfirmed = json['isConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['partyId'] = this.partyId;
    data['name'] = this.name;
    data['isConfirmed'] = this.isConfirmed;
    return data;
  }
}
