// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element

import 'package:flutter/material.dart';
import '../Plastics/plastics_page.dart';
import '../Clothes/clothes_page.dart';
import '../Papers/papers_page.dart';
import '../Shopping/shopping_page.dart';
import '../Profile/profile_page.dart';
import '../Additional pages/coupons_page.dart';
import '../Additional pages/wallet_page.dart';
import '../Additional pages/new_arrivals_page.dart';
import '../Clothes/gender_selection.dart';
import '../Additional pages/bottom_floating_widget.dart';

class HomePage extends StatelessWidget {
  void _navigateToPlasticBottlesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlasticsPage()),
    );
  }

  void _navigateToClothesPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GenderSelectionPage()),
    );
  }

  void _navigateToPapersPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PapersPage()),
    );
  }

  void _navigateToShopProductsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShoppingPage()),
    );
  }

  void _navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfilePage()),
    );
  }

  void _navigateToWalletPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WalletPage()),
    );
  }

  void _navigateToCouponsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CouponsPage()),
    );
  }

  void _navigateToNewArrivalsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewArrivalsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'images/ABG.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsetsDirectional.only(
                  top: screenHeight * 0.05,
                  bottom: screenHeight * 0.1,
                  start: screenWidth * 0.05,
                  end: screenWidth * 0.05,
                ),
                color: Color.fromARGB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIconButton(
                      icon: Icons.person,
                      label: 'Profile',
                      size: screenWidth * 0.15,
                      onTap: () => _navigateToProfilePage(context),
                    ),
                    _buildIconButton(
                      icon: Icons.account_balance_wallet,
                      label: 'Wallet',
                      size: screenWidth * 0.15,
                      onTap: () => _navigateToWalletPage(context),
                    ),
                    _buildIconButton(
                      icon: Icons.local_offer,
                      label: 'Coupons',
                      size: screenWidth * 0.15,
                      onTap: () => _navigateToCouponsPage(context),
                    ),
                    _buildIconButton(
                      icon: Icons.new_releases,
                      label: 'New Arrivals',
                      size: screenWidth * 0.15,
                      onTap: () => _navigateToNewArrivalsPage(context),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: screenHeight * 0.02,
                    bottom: screenHeight * 0.02,
                    start: screenWidth * 0.05,
                    end: screenWidth * 0.05,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: screenWidth * 0.16,
                    children: [
                      _buildContentContainer(
                          image: 'images/bottle.jpg',
                          label: 'Plastics',
                          screenWidth: screenWidth,
                          onTap: () => _navigateToPlasticBottlesPage(context)),
                      _buildContentContainer(
                          image: 'images/clothes.jpg',
                          label: 'Clothes',
                          screenWidth: screenWidth,
                          onTap: () => _navigateToClothesPage(context)),
                      _buildContentContainer(
                          image: 'images/paper.png',
                          label: 'Papers',
                          screenWidth: screenWidth,
                          onTap: () => _navigateToPapersPage(context)),
                      _buildContentContainer(
                          image: 'images/shop.jpg',
                          label: 'Shop products',
                          screenWidth: screenWidth,
                          onTap: () => _navigateToShopProductsPage(context)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          BottomFloatingWidget()
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String label,
    required double size,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: size * 0.5,
            backgroundColor: Colors.transparent,
            child: Icon(
              icon,
              size: size * 0.4,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            label,
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildContentContainer({
    required String image,
    required String label,
    required double screenWidth,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                image,
                width: screenWidth * 0.30,
                height: screenWidth * 0.30,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenWidth * 0.03),
            Text(
              label,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
