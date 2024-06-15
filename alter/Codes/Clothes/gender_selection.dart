// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'clothes_page.dart';
import 'bottom_floating_widget.dart';
import 'place_order.dart';

class GenderSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Gender'),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/ABG.png'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.1,
                  ),
                  GenderCard(
                    'Men',
                    'images/men_icon.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClothesPage('Men'),
                        ),
                      );
                    },
                    screenWidth,
                    screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  GenderCard(
                    'Women',
                    'images/women_icon.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClothesPage('Women'),
                        ),
                      );
                    },
                    screenWidth,
                    screenHeight,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.7, left: screenWidth * 0.36),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PlaceOrder(),
                ));
              },
              child: Text('Place Order'),
            ),
          ),
          BottomFloatingWidget(),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final String gender;
  final String imagePath;
  final VoidCallback onTap;
  final double screenWidth;
  final double screenHeight;

  GenderCard(this.gender, this.imagePath, this.onTap, this.screenWidth,
      this.screenHeight);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        margin: EdgeInsets.all(screenWidth * 0.04),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          child: Container(
            width: screenWidth * 0.4,
            height: screenHeight * 0.2,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: screenWidth * 0.2,
                  height: screenHeight * 0.1,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  gender,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
