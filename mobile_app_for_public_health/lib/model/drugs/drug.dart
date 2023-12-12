class Drug {
  final String name;
  final String category;
  final String ingredients;

  Drug({
    required this.name,
    required this.category,
    required this.ingredients,
  });
}

final List<Drug> drugList = [
  Drug(name: 'Ibuprofen', category: 'Schmerzmittel', ingredients: 'Ibuprofen'),
  Drug(
      name: 'Paracetamol',
      category: 'Schmerzmittel',
      ingredients: 'Paracetamol'),
  Drug(
      name: 'Aspirin',
      category: 'Schmerzmittel',
      ingredients: 'Acetylsalicylsäure'),
  Drug(name: 'Naproxen', category: 'Schmerzmittel', ingredients: 'Naproxen'),
  Drug(
      name: 'Diclofenac', category: 'Schmerzmittel', ingredients: 'Diclofenac'),
  Drug(name: 'Tramadol', category: 'Schmerzmittel', ingredients: 'Tramadol'),
  Drug(name: 'Codein', category: 'Schmerzmittel', ingredients: 'Codein'),
  Drug(name: 'Celecoxib', category: 'Schmerzmittel', ingredients: 'Celecoxib'),
  Drug(
      name: 'Acetaminophen',
      category: 'Schmerzmittel',
      ingredients: 'Acetaminophen'),
  Drug(
      name: 'Amoxicillin',
      category: 'Antibiotikum',
      ingredients: 'Amoxicillin'),
  Drug(
      name: 'Ciprofloxacin',
      category: 'Antibiotikum',
      ingredients: 'Ciprofloxacin'),
  Drug(name: 'Doxycyclin', category: 'Antibiotikum', ingredients: 'Doxycyclin'),
];
