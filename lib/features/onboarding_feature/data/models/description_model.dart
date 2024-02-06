class DescriptionModel {
  String? description1;
  String? description2;
  String? description3;

  DescriptionModel({this.description1, this.description2, this.description3});

  factory DescriptionModel.fromMap(dynamic map) {
    return DescriptionModel(
      description1: map['description1']?.toString(),
      description2: map['description2']?.toString(),
      description3: map['description3']?.toString(),
    );
  }
}
