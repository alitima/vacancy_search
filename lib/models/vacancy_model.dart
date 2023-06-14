import 'package:flutter/foundation.dart';

@immutable
class VacancyModel {
  const VacancyModel({
    required this.position,
    required this.salary,
    required this.description,
    required this.location,
    required this.contact,
  });

  final String position;
  final int salary;
  final String description;
  final String location;
  final String contact;

  factory VacancyModel.fromJson(Map<String, dynamic> json) {
    return VacancyModel(
      position: json['position'],
      salary: json['salary'],
      description: json['description'],
      location: json['location'],
      contact: json['contact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'salary': salary,
      'description': description,
      'location': location,
      'contact': contact,
    };
  }
}
