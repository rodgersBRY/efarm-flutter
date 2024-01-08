class Employee {
  String name;
  String idNo;
  String phoneNo;
  bool active;

  Employee({
    required this.name,
    required this.idNo,
    required this.phoneNo,
    required this.active,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"],
        idNo: json["idNo"],
        phoneNo: json["phoneNo"],
        active: json["active"],
      );
}
