// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ShoppingPage extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel(
      imagePath: 'images/product1.avif',
      price: 'MRP ₹1,299',
      productName: 'Regular Fit Cotton Crew-Neck T-Shirt',
      productDetails: [
        'Slim fit denim jeans',
        'Available in various sizes',
        'Machine washable',
        'Made of high-quality denim fabric',
      ],
      rating: 4,
    ),
    ProductModel(
      imagePath: 'images/product2.png',
      price: 'MRP ₹799',
      productName: 'Slim Fit Denim Jeans',
      rating: 4.5,
      productDetails: [
        'Slim fit denim jeans',
        'Available in various sizes',
        'Machine washable',
        'Made of high-quality denim fabric',
      ],
    ),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Page'),
        backgroundColor: Colors.black87,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: ProductCard(product: product), // Pass the product directly
          );
        },
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductModel product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final product = widget.product;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(screenWidth * 0.04),
      ),
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight * 0.5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(screenWidth * 0.04),
                      bottomLeft: Radius.circular(screenWidth * 0.04),
                    ),
                    child: Image.asset(
                      product.imagePath,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.productName,
                          style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Colors.yellow,
                            ),
                            Text(
                              product.rating.toString(),
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          product.price,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Text(
                          "Product Details",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: product.productDetails.map((detail) {
                            return Text(
                              detail,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                              ),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: screenHeight * 0.07),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Add to Cart"),
                                SizedBox(width: screenWidth * 0.05),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 0,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked; // Toggle the like status
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: CircleBorder(),
              ),
              child: Icon(
                isLiked ? Icons.favorite : Icons.favorite_outline,
                color: isLiked ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductModel {
  final String imagePath;
  final String price;
  final String productName;
  final double rating;
  final List<String> productDetails;

  ProductModel({
    required this.imagePath,
    required this.price,
    required this.productName,
    required this.rating,
    required this.productDetails,
  });
}
