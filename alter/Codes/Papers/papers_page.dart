// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'newsprint_input.dart';
import 'notebook_input.dart';
import 'cardstock_input.dart';
import 'place_order.dart';
import 'cottonpaper_input.dart';
import 'bottom_floating_widget.dart';

class PapersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Papers'),
        backgroundColor: Colors.black87,
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
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                padding: EdgeInsets.all(screenWidth * 0.1),
                childAspectRatio: 0.8,
                children: [
                  _buildPaperCard(
                    'Newsprint',
                    'images/newspaper.png',
                    screenWidth,
                    screenHeight,
                    NewsprintInputPage(),
                    context,
                  ),
                  _buildPaperCard(
                    'Notebooks',
                    'images/notebooks.png',
                    screenWidth,
                    screenHeight,
                    NotebookInputPage(),
                    context,
                  ),
                  _buildPaperCard(
                    'Cardstock',
                    'images/cardstock.png',
                    screenWidth,
                    screenHeight,
                    CardstockInputPage(),
                    context,
                  ),
                  _buildPaperCard(
                    'Cotton Paper',
                    'images/cotton_paper.png',
                    screenWidth,
                    screenHeight,
                    CottonpaperInputPage(),
                    context,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.65, left: screenWidth * 0.36),
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

  Widget _buildPaperCard(
    String title,
    String imagePath,
    double screenWidth,
    double screenHeight,
    Widget navigateToPage,
    BuildContext context,
  ) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => navigateToPage),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: screenHeight * 0.1,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
