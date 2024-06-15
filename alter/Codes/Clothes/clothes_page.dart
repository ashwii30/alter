// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'place_order.dart';
import 'gender_selection.dart';
import 'clothing_details_page.dart';
import 'InputPages/men_denim.dart';
import 'InputPages/men_others.dart';
import 'InputPages/men_pants.dart';
import 'InputPages/men_shirts.dart';
import 'InputPages/men_trousers.dart';
import 'InputPages/men_tshirts.dart';
import 'InputPages/women_denim.dart';
import 'InputPages/women_shorts.dart';
import 'InputPages/women_skirts.dart';
import 'InputPages/women_tshirts.dart';
import 'InputPages/women_shirts.dart';
import 'InputPages/women_saree.dart';
import 'bottom_floating_widget.dart';

class ClothesPage extends StatefulWidget {
  final String gender;
  ClothesPage(this.gender);

  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class MenClothes {
  static const List<String> categories = [
    'Shirts for Men',
    'T-Shirt for Men',
    'Denims for Men',
    'Pants for Men',
    'Trousers for Men',
    'Other Casuals'
  ];
}

class WomenClothes {
  static const List<String> categories = [
    'Saree',
    'Shirts for Women',
    'T-Shirt for Women',
    'Denims',
    'Shorts for Women',
    'Skirts for Women',
  ];
}

class _ClothesPageState extends State<ClothesPage> {
  final Map<String, Widget> navigateFunctions = {
    'Shirts for Men': MenShirts(),
    'T-Shirt for Men': MenTshirts(),
    'Denims for Men': MenDenim(),
    'Pants for Men': MenPants(),
    'Trousers for Men': MenTrousers(),
    'Other Casuals': Casuals(),
    'Saree': Saree(),
    'Shirts for Women': WomenShirts(),
    'T-Shirt for Women': WomenTshirts(),
    'Denims': WomenDenim(),
    'Shorts for Women': WomenShorts(),
    'Skirts for Women': WomenSkirts(),
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> categories = widget.gender.toLowerCase() == 'men'
        ? MenClothes.categories
        : WomenClothes.categories;

    return Scaffold(
      appBar: AppBar(
        title: Text('Clothes'),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ABG.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.03,
                  mainAxisSpacing: screenHeight * 0.03,
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  children: categories.map((label) {
                    return _buildRoundedClothingCard(
                      label,
                      screenWidth,
                      screenHeight,
                      'images/clothes.jpg',
                      navigateFunctions[label]!,
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: screenHeight * 0.05, left: screenWidth * 0.01),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlaceOrder(),
                    ));
                  },
                  child: Text('Place Order'),
                ),
              ),
              BottomFloatingWidget()
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedClothingCard(
    String label,
    double screenWidth,
    double screenHeight,
    String imagePath,
    Widget navigateToPage,
  ) {
    double cardWidth = screenWidth * 0.4;
    double cardHeight = screenHeight * 0.3;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateToPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          child: Container(
            width: cardWidth * 0.5,
            height: cardHeight * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imagePath,
                    width: cardWidth * 0.4,
                    height: cardHeight * 0.4,
                  ),
                  SizedBox(height: screenHeight * 0.012),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: screenHeight * 0.012,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 189, 124, 124),
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
