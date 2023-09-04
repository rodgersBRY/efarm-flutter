class CowModel {
  String breed;
  String name;
  int tagNo;
  String gender;
  int weight;
  String dob;
  String modeOfAcquiring;
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
  });

  factory CowModel.fromJson(Map<String, dynamic> json) => CowModel(
        breed: json["breed"],
        name: json["name"],
        tagNo: json["tagNo"],
        gender: json["gender"],
        weight: json["weight"],
        dob: json["dob"],
        modeOfAcquiring: json["modeOfAcquiring"],
        notes: json["notes"],
      );
}
