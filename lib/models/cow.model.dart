class CowModel {
  String id;
  String breed;
  String name;
  int tagNo;
  String gender;
  int weight;
  String dob;
  bool milked;
  String modeOfAcquiring;
  List? offspring;
  int? motherTag;
  int? fatherTag;
  String? notes;

  CowModel({
    required this.id,
    required this.breed,
    required this.name,
    required this.tagNo,
    required this.gender,
    required this.weight,
    required this.dob,
    required this.milked,
    required this.modeOfAcquiring,
    required this.notes,
    this.offspring,
    this.fatherTag,
    this.motherTag,
  });

  factory CowModel.fromJson(Map<String, dynamic> json) => CowModel(
        id: json["_id"],
        breed: json["breed"],
        name: json["name"],
        tagNo: json["tagNo"],
        gender: json["gender"],
        weight: json["weight"],
        milked: json['milked'],
        dob: json["dob"],
        modeOfAcquiring: json["modeOfAcquiring"],
        motherTag: json["motherTag"],
        fatherTag: json["fatherTag"],
        offspring: json['offspring'],
        notes: json["notes"],
      );
}
