import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vacancy_search/models/vacancy_model.dart';

class VacancyInfoPage extends StatelessWidget {
  const VacancyInfoPage({super.key, required this.vacancy});

  final VacancyModel vacancy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vacancy.position),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(vacancy.description),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => Colors.blue,
            ),
          ),
          onPressed: () {},
          child: GestureDetector(
            onTap: () {
              launchUrl(
                Uri(
                  scheme: 'tel',
                  path: vacancy.contact,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.call, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    'Позвонить'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
