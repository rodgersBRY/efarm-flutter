class MilkingModel {
  String dateTime;
  CowInfo cowInfo;
  int yield;
  int yieldOnCalf;
  String observations;

  MilkingModel({
    required this.dateTime,
    required this.cowInfo,
    required this.yield,
    required this.yieldOnCalf,
    required this.observations,
  });

  factory MilkingModel.fromJson(Map<String, dynamic> json) => MilkingModel(
        dateTime: json["dateTime"],
        cowInfo: CowInfo.fromJson(json["cowInfo"]),
        yield: json["yield"],
        yieldOnCalf: json["yieldOnCalf"] ?? "",
        observations: json["observations"] ?? "",
      );
}

class CowInfo {
  String name;
  int tagNo;

  CowInfo({
    required this.name,
    required this.tagNo,
  });

  factory CowInfo.fromJson(Map<String, dynamic> json) => CowInfo(
        name: json["name"],
        tagNo: json["tagNo"],
      );
}
