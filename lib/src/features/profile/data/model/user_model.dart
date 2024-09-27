class AppUser {
  String? id;
  String? name;
  String? email;
  String? image;
  String? gender;
  String? phoneNumber;
  String? age;

  AppUser(
      {this.name,
      this.email,
      this.id,
      this.image,
      this.gender,
      this.phoneNumber,
      this.age});

  AppUser.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    email = data['email'];
    image = data['image'];
    gender = data['gender'];
    phoneNumber = data['phoneNumber'];
    age = data['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['gender'] = gender;
    data['phoneNumber'] = phoneNumber;
    data['age'] = age;

    return data;
  }
}
