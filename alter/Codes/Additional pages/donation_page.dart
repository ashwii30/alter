// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element
import 'package:flutter/material.dart';
import 'bottom_floating_widget.dart';

class DonationPage extends StatefulWidget {
  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final TextEditingController _donationAmountController =
      TextEditingController();

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirm Donation'),
          content: Text(
              'Are you sure you want to donate ${_donationAmountController.text} Alter Coins?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _donateCoins();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Donate'),
            ),
          ],
        );
      },
    );
  }

  void _donateCoins() {
    final donationAmount = _donationAmountController.text;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Donation successful. You have donated $donationAmount Alter Coins.'),
        duration: Duration(seconds: 3), // Adjust the duration as needed
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Donation Page'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/ABG.png'), // Provide your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Enter the amount of Alter Coins to donate:',
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      controller: _donationAmountController,
                      keyboardType: TextInputType.number,
                      // decoration: InputDecoration(labelText: 'Donation Amount'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _showConfirmationDialog,
                    child: Text('Donate'),
                  ),
                ],
              ),
            ),
          ),
          BottomFloatingWidget()
        ],
      ),
    );
  }

  @override
  void dispose() {
    _donationAmountController.dispose();
    super.dispose();
  }
}
