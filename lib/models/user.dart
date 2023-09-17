class User {
  int? _id;
  late String name;
  late String initials;
  late String _createdAt;
  late String updatedAt;

  User({
    required this.name,
    int? id,
    this.initials = "",
    String createdAt = "",
    this.updatedAt = "",
  })  : _id = id,
        _createdAt = createdAt;

  int get id => _id ?? 0;

  User.fromJson(Map<String, dynamic> json) {
    _id = json["id"];
    name = json["name"];
    initials = json["initials"];
    _createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = _id;
    data["name"] = name;
    data["initials"] = initials;
    data["created_at"] = _createdAt;
    data["updated_at"] = updatedAt;

    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}
