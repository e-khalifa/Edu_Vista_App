import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_vista/src/features/instructor/data/instructor_model.dart';

import '../../category/data/category_model.dart';

class Course {
  String? id;
  String? title;
  String? image;
  Category? category;
  String? currency;
  String? rank;
  bool? hasCertificate;
  Instructor? instructor;
  double? price;
  double? rating;
  int? totalHours;
  DateTime? createdDate;
  bool? hasBought;
    String? resource;


  Course.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    image = data['image'];
    category =
        data['category'] != null ? Category.fromJson(data['category']) : null;
    currency = data['currency'];
    rank = data['rank'];
    hasCertificate = data['has_certificate'];
    instructor = data['instructor'] != null
        ? Instructor.fromJson(data['instructor'])
        : null;
    price = data['price'] is int
        ? (data['price'] as int).toDouble()
        : data['price'];
    rating = data['rating'] is int
        ? (data['rating'] as int).toDouble()
        : data['rating'];
    totalHours = data['total_hours'];
    createdDate = data['created_date'] != null
        ? (data['created_date'] as Timestamp).toDate()
        : null;
    hasBought = data['hasBought'];
        resource = data['resource'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['category'] = category?.toJson();
    data['currency'] = currency;
    data['rank'] = rank;
    data['has_certificate'] = hasCertificate;
    data['instructor'] = instructor?.toJson();
    data['price'] = price;
    data['rating'] = rating;
    data['hasBought'] = hasBought;
    data['resource'] = resource;

    data['total_hours'] = totalHours;
    return data;
  }
}
