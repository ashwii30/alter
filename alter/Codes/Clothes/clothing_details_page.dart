// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ClothingDetailsPage extends StatefulWidget {
  @override
  _ClothingDetailsPageState createState() => _ClothingDetailsPageState();
}

class _ClothingDetailsPageState extends State<ClothingDetailsPage> {
  final List<String> ageOptions = [
    'Recently Bought',
    'A Year Ago',
    'More Than 3 Years',
  ];

  final List<String> clothMaterialOptions = [
    'Cotton',
    'Silk',
    'Polyester',
    'Denim',
    'Chiffon',
  ];

  String selectedAge = 'Recently Bought';
  TextEditingController quantityController = TextEditingController();
  String selectedClothMaterial = 'Cotton';
  String errorMessage = '';

  void handleQuantityChange(String newValue) {
    int newQuantity = int.tryParse(newValue) ?? 0;

    if (newQuantity > 250) {
      setState(() {
        errorMessage = 'Quantity exceeded the limit (250)';
        quantityController.clear();
      });
    } else {
      setState(() {
        errorMessage = '';
      });
    }
  }

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
              onChanged: handleQuantityChange,
            ),
            SizedBox(height: screenHeight * 0.015),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            Text(
              'Wear Span',
              style: TextStyle(
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: selectedAge,
              onChanged: (newValue) {
                setState(() {
                  selectedAge = newValue!;
                });
              },
              items: ageOptions.map((age) {
                return DropdownMenuItem<String>(
                  value: age,
                  child: Text(age),
                );
              }).toList(),
            ),
            SizedBox(height: screenHeight * 0.10),
            Text(
              'Material',
              style: TextStyle(
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: selectedClothMaterial,
              onChanged: (newValue) {
                setState(() {
                  selectedClothMaterial = newValue!;
                });
              },
              items: clothMaterialOptions.map((material) {
                return DropdownMenuItem<String>(
                  value: material,
                  child: Text(material),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
