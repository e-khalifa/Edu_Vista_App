class Instructor {
  String? id;
  String? name;
  String? education;
  String? image;

  int? yearsOfExperience;

  Instructor.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    education = data['education'];
    image = data['image'];

    yearsOfExperience = data['years_of_experience'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['education'] = education;
    data['image'] = image;

    data['years_of_experience'] = yearsOfExperience;
    return data;
  }
}
