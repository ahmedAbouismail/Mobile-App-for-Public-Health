import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_for_public_health/model/drugs/drug.dart';
import 'src/authentification/screens/welcome/welcome.dart';
import 'src/constants/styles.dart';
import 'package:get/get.dart';

void main() {
  runApp(const App()); //Start die App
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      //home: const WelcomePage(),
      //home: LoginScreen(),
      home: const DrugListPage(),
    );
  }
}

class DrugListPage extends StatefulWidget {
  const DrugListPage({super.key});

  @override
  State<DrugListPage> createState() => _DrugListPageState();
}

class _DrugListPageState extends State<DrugListPage> {
  final List<String> categories = ['Schmerzmittel', 'Antibiotika'];

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    final filterDrugs = drugList.where((drug) {
      return selectedCategories.isEmpty ||
          selectedCategories.contains(drug.category);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Record using Chip'),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: categories
                .map(
                  (category) => FilterChip(
                      label: Text(category),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedCategories.add(category);
                          } else {
                            selectedCategories.remove(category);
                          }
                        });
                      }),
                )
                .toList(),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: filterDrugs.length,
              itemBuilder: (context, index) {
                final drug = filterDrugs[index];
                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.indigoAccent),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      title: Text(
                        drug.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        drug.category,
                        style: const TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
