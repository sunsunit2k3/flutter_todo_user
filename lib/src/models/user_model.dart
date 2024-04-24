class UserModel {
  String? sId;
  String? name;
  String? age;
  String? major;
  String? address;
  String? phone;
  String? email;

  UserModel(
      {this.sId,
      this.name,
      this.age,
      this.address,
      this.email,
      this.major,
      this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    age = json['age'];
    major = json['major'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['age'] = age;
    data['major'] = major;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
