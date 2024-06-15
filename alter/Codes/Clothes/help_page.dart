// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element, prefer_const_constructors_in_immutables

import '../Home Page/home_page.dart';
import 'package:flutter/material.dart';
import 'bottom_floating_widget.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
        ),
        backgroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: fontSize * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                FAQItem(
                  question: 'How do I place an order?',
                  answer:
                      'You can place an order by selecting the desired product, adding it to your cart, and proceeding to checkout.',
                  fontSize: fontSize,
                ),
                FAQItem(
                  question: 'What payment methods are accepted?',
                  answer:
                      'We accept credit/debit cards, PayPal, and other popular payment methods. You can view all accepted payment options during checkout.',
                  fontSize: fontSize,
                ),
                FAQItem(
                  question: 'How can I track my order?',
                  answer:
                      'Once your order is shipped, you will receive a tracking number via email. You can use this tracking number to track your order on our website.',
                  fontSize: fontSize,
                ),
                SizedBox(height: screenHeight * 0.04),
                Text(
                  'Need Further Assistance?',
                  style: TextStyle(
                    fontSize: fontSize * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'If you need further assistance, you can contact our customer support team:',
                  style: TextStyle(fontSize: fontSize),
                ),
                SizedBox(height: screenHeight * 0.01),
                ElevatedButton(
                  onPressed: () {
                    // Handle chat option
                    // You can implement a chat feature here.
                  },
                  child: Text('Chat with Us',
                      style: TextStyle(fontSize: fontSize)),
                ),
                SizedBox(height: screenHeight * 0.01),
                ElevatedButton(
                  onPressed: () {
                    // Handle call option
                    // You can implement a call feature here.
                  },
                  child: Text('Call Us', style: TextStyle(fontSize: fontSize)),
                ),
              ],
            ),
          ),
          BottomFloatingWidget()
        ],
      ),
    );
  }
}

class FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final double fontSize;

  FAQItem({
    required this.question,
    required this.answer,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontSize: fontSize),
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(fontSize),
          child: Text(
            answer,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
      ],
    );
  }
}
