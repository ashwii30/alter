// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_local_variable, unused_field, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'bottle_input.dart';
import 'box_input.dart';
import 'pp_input.dart';
import 'used_input.dart';
import 'place_order.dart';
import '../Additional pages/bottom_floating_widget.dart';

class PlasticsPage extends StatefulWidget {
  @override
  _PlasticsPageState createState() => _PlasticsPageState();
}

class _PlasticsPageState extends State<PlasticsPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Plastics'),
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
                mainAxisSpacing: 20.0, // Adjust the vertical spacing as needed
                crossAxisSpacing:
                    20.0, // Adjust the horizontal spacing as needed
                padding: EdgeInsets.all(screenWidth * 0.1),
                childAspectRatio: 0.8,
                children: [
                  _buildRoundedPlasticCard(
                    'Bottles',
                    screenWidth,
                    screenHeight,
                    'images/small bottles.jpeg',
                    BottleInputPage(),
                  ),
                  _buildRoundedPlasticCard(
                    'Boxes',
                    screenWidth,
                    screenHeight,
                    'images/plasticb.jpg',
                    BoxInput(),
                  ),
                  _buildRoundedPlasticCard(
                    'Poly Propylene',
                    screenWidth,
                    screenHeight,
                    'images/poly.png',
                    PpInputPage(),
                  ),
                  _buildRoundedPlasticCard(
                    'Used Containers',
                    screenWidth,
                    screenHeight,
                    'images/usedcontainers.png',
                    UsedInput(),
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

  Widget _buildRoundedPlasticCard(
    String label,
    double screenWidth,
    double screenHeight,
    String imagePath,
    Widget inputPage,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => inputPage));
        },
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imagePath,
                  width: screenHeight * 0.14,
                  height: screenHeight * 0.14,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: screenHeight * 0.012,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
