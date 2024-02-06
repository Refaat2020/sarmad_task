import 'description_model.dart';

class UserIndividualModel {
  final String? firstName;
  final String? middleName;
  final List<DescriptionModel>? descriptions;
  final String? nationality;
  final List<String?>? placeOfBirth;
  final int? score;

  UserIndividualModel(
      {this.firstName,
      this.middleName,
      this.descriptions,
      this.nationality,
      this.placeOfBirth,
      this.score});

  Map<String, dynamic> toMap() {
    return {
      'fname': firstName,
      'mname': middleName,
      'nat': nationality,
    };
  }

  factory UserIndividualModel.fromMap(dynamic map) {
    // ignore: prefer_typing_uninitialized_variables
    var temp;
    return UserIndividualModel(
      firstName: map['name']?.toString(),
      descriptions: null == (temp = map['descriptions'])
          ? []
          : (temp is List
              ? temp.map((map) => DescriptionModel.fromMap(map)).toList()
              : []),
      nationality: map['nat']?.toString(),
      placeOfBirth: null == (temp = map['places_of_birth'])
          ? []
          : (temp is List ? temp.map((map) => map?.toString()).toList() : []),
      score: null == (temp = map['score'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp)),
    );
  }
}
