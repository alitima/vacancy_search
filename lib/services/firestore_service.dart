import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacancy_search/models/vacancy_model.dart';

class FirestoreService {
  static final _collection = FirebaseFirestore.instance.collection('vacancies');

  static Future<List<VacancyModel>> getVacancies(String pattern) async {
    final snapshot = await _collection.get();
    final vacancies = <VacancyModel>[];
    for (final doc in snapshot.docs) {
      final data = doc.data();
      final position = data['position'] as String;
      if (position.toLowerCase().contains(pattern.toLowerCase())) {
        vacancies.add(VacancyModel.fromJson(data));
      }
    }
    return vacancies;
  }

  static Future<void> putVacancies(Iterable<VacancyModel> vacancies) async {
    for (final vacancy in vacancies) {
      await _collection.add(vacancy.toJson());
    }
  }
}
