// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BoxInput extends StatefulWidget {
  @override
  _BoxInputState createState() => _BoxInputState();
}

class _BoxInputState extends State<BoxInput> {
  final List<String> ageOptions = [
    'Recently Bought',
    'Few months ago',
    'More than a year',
  ];

  final List<String> bottleMaterialOptions = [
    'Plastic',
    'Glass',
  ];

  String selectedAge = 'Recently Bought';
  TextEditingController quantityController = TextEditingController();
  String selectedBottleMaterial = 'Plastic';
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

  Future<void> saveBoxData() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // Handle the case where the user is not logged in.
      return;
    }

    final String userId = user.uid;
    final int quantity = int.tryParse(quantityController.text) ?? 0;

    if (quantity <= 0) {
      // Display an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Quantity must be greater than 0.'),
        ),
      );
      return;
    }
    try {
      await firestore.collection('plastics/$userId/box').add({
        'quantity': quantityController.text,
        'usageSpan': selectedAge,
        'bottleMaterial': selectedBottleMaterial,
        'timestamp': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Data saved successfully!'),
        ),
      );
    } catch (e) {
      // Handle the error here.
      print('Error saving data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Box Details'),
        actions: [
          TextButton(
            onPressed: () {
              saveBoxData();
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.01),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                  border: InputBorder.none,
                ),
                onChanged: handleQuantityChange,
              ),
            ),
            Text(
              errorMessage,
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            SizedBox(height: screenHeight * 0.15),
            Text(
              'Usage Span',
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
              'Box Material',
              style: TextStyle(
                fontSize: screenHeight * 0.015,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton<String>(
              value: selectedBottleMaterial,
              onChanged: (newValue) {
                setState(() {
                  selectedBottleMaterial = newValue!;
                });
              },
              items: bottleMaterialOptions.map((material) {
                return DropdownMenuItem<String>(
                  value: material,
                  child: Text(material),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: saveBoxData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
