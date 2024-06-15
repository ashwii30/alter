// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element
import 'package:flutter/material.dart';

class CouponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Coupon> coupons = [
      Coupon('25% Off', 'Get 25% off on your next purchase', '25OFF'),
      Coupon('Free Shipping', 'Enjoy free shipping on orders', 'SHIPFREE'),
      Coupon('50% Off', 'Get 50% off on your next purchase', '50OFF'),
      Coupon('2X Alter Coins', 'Get 2x Alter coins on next purchase', '2x AC'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Coupons'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/ABG.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            final coupon = coupons[index];
            return _buildCouponCard(context, coupon);
          },
        ),
      ),
    );
  }

  Widget _buildCouponCard(BuildContext context, Coupon coupon) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(coupon.title),
        subtitle: Text(coupon.description),
        trailing: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Coupon Redeemed'),
                  content: Text('Coupon "${coupon.title}" has been redeemed.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Redeem'),
        ),
      ),
    );
  }
}

class Coupon {
  final String title;
  final String description;
  final String code;

  Coupon(this.title, this.description, this.code);
}
