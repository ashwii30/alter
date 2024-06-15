// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'bottom_floating_widget.dart';
import 'donation_page.dart';

class WalletPage extends StatefulWidget {
  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _alterCoins = 20; // Initial Alter coins balance
  List<Transaction> _transactions = [
    Transaction("added", DateTime(2023, 8, 21, 10, 30), 50),
    Transaction("spent", DateTime(2023, 8, 22, 15, 45), 20),
    Transaction("added", DateTime(2023, 8, 23, 9, 15), 30),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Wallet'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ABG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                margin: EdgeInsets.all(screenWidth * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo image
                    Image.asset(
                      'images/AC.png',
                      width: screenHeight * 0.1, // Adjust the size
                      height: screenHeight * 0.1, // Adjust the size
                    ),
                    SizedBox(width: 16), // Adjust the spacing
                    // Alter Coins text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_alterCoins',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Alter Coins',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.04,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonationPage()));
              },
              child: Text('Donate'),
            ),
            Text(
              'Transaction List',
              style: TextStyle(
                fontSize: screenHeight * 0.03,
                fontWeight: FontWeight.w300,
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                margin: EdgeInsets.all(screenWidth * 0.1),
                child: ListView.builder(
                  itemCount: _transactions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TransactionListItem(
                          transaction: _transactions[index],
                        ),
                        Divider(
                          height: 0,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            BottomFloatingWidget()
          ],
        ),
      ),
    );
  }
}

class Transaction {
  final String type;
  final DateTime dateTime;
  final int amount;

  Transaction(this.type, this.dateTime, this.amount);
}

class TransactionListItem extends StatelessWidget {
  final Transaction transaction;

  TransactionListItem({required this.transaction});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color iconColor;
    String sign;
    String t;

    if (transaction.type == "added") {
      icon = Icons.add;
      iconColor = Colors.green;
      sign = "+";
      t = "Gained Alter Coins";
    } else {
      icon = Icons.remove;
      iconColor = Colors.red;
      sign = "-";
      t = "Spent Alter Coins";
    }

    String formattedDate =
        DateFormat('MMMM d, hh:mma').format(transaction.dateTime);

    return ListTile(
      leading: Container(
        width: 30, // Adjust the size of the circle
        height: 30, // Adjust the size of the circle
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: iconColor
              .withOpacity(0.2), // Adjust the opacity or use a different color
        ),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t),
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Text(
            '$sign${transaction.amount}',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}
