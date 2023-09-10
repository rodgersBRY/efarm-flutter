class CowModel {
  String breed;
  String name;
  int tagNo;
  String gender;
  int weight;
  String dob;
  String modeOfAcquiring;
  List? offspring;
  int? motherTag;
  int? fatherTag;
  String notes;

  CowModel({
    required this.breed,
    required this.name,
    required this.tagNo,
    required this.gender,
    required this.weight,
    required this.dob,
    required this.modeOfAcquiring,
    required this.notes,
    this.offspring,
    this.fatherTag,
    this.motherTag,
  });

  factory CowModel.fromJson(Map<String, dynamic> json) => CowModel(
        breed: json["breed"],
        name: json["name"],
        tagNo: json["tagNo"],
        gender: json["gender"],
        weight: json["weight"],
        dob: json["dob"],
        modeOfAcquiring: json["modeOfAcquiring"],
        motherTag: json["motherTag"],
        fatherTag: json["fatherTag"],
        offspring: json['offspring'],
        notes: json["notes"],
      );
}
