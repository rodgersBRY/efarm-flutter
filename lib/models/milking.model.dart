class MilkingModel {
  String dateTime;
  String cowName;
  int tagNo;
  int yield;
  int yieldOnCalf;
  String observations;

  MilkingModel({
    required this.dateTime,
    required this.cowName,
    required this.tagNo,
    required this.yield,
    required this.yieldOnCalf,
    required this.observations,
  });

  factory MilkingModel.fromJson(Map<String, dynamic> json) => MilkingModel(
        dateTime: json["dateTime"],
        cowName: json['cowName'],
        tagNo: json['tagNo'],
        yield: json["yield"],
        yieldOnCalf: json["yieldOnCalf"] ?? "",
        observations: json["observations"] ?? "",
      );
}