import 'package:flutter/material.dart';
import 'package:vacancy_search/services/firestore_service.dart';
import 'package:vacancy_search/view/pages/vacancy_info_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.keyword,
  });

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вакаксии'),
      ),
      body: FutureBuilder(
        future: FirestoreService.getVacancies(keyword),
        builder: (context, snapshot) {
          final vacancies = snapshot.data;

          if (vacancies == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: ListView.separated(
              itemCount: vacancies.length,
              itemBuilder: (context, index) {
                final vacancy = vacancies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VacancyInfoPage(vacancy: vacancy),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 7,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vacancy.position,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                vacancy.salary.toString() + r'c',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.place,
                                color: Colors.grey,
                              ),
                              Text(vacancy.location),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            vacancy.description.length > 100
                                ? '${vacancy.description.substring(0, 100)}...'
                                : vacancy.description,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.call),
                              const SizedBox(width: 10),
                              Text(vacancy.contact),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 6);
              },
            ),
          );
        },
      ),
    );
  }
}
