class UserModel {
  String? id;
  String? displayName;
  String? username;
  List<String>? roles;
  bool? active;
  int? experienceYears;
  String? address;
  String? level;
  String? createdAt;
  String? updatedAt;
  int? v;

  UserModel(
      {this.id,
        this.displayName,
        this.username,
        this.roles,
        this.active,
        this.experienceYears,
        this.address,
        this.level,
        this.createdAt,
        this.updatedAt,
        this.v});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    displayName = json['displayName'];
    username = json['username'];
    roles = json['roles'].cast<String>();
    active = json['active'];
    experienceYears = json['experienceYears'];
    address = json['address'];
    level = json['level'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['displayName'] = displayName;
    data['username'] = username;
    data['roles'] = roles;
    data['active'] = active;
    data['experienceYears'] = experienceYears;
    data['address'] = address;
    data['level'] = level;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = v;
    return data;
  }
}