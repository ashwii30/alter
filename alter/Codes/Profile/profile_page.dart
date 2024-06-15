// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, unused_import, unused_element, must_be_immutable, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'edit_profile_page.dart';
import '../Login/login_pg.dart';
import '../Home Page/home_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _name = 'Full Name';
  String _email = 'Email';
  String _phoneNumber = '';
  String _address = '';
  String _gender = '';
  int _age = 0;

  @override
  void initState() {
    super.initState();
    _fetchUserProfileDetails();
  }

  Future<void> _fetchUserProfileDetails() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case where the user is not logged in.
      return;
    }

    final String userId = user.uid;

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        setState(() {
          _name = userDoc['full_name'];
          _email = user.email!;
          _phoneNumber = userDoc['phone_number'];
          _address = userDoc['address'];
          _gender = userDoc['gender'];
          _age = userDoc['age'];
        });
      }
    } catch (e) {
      // Handle the error here.
      print('Error fetching user data: $e');
    }
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _logoutAndNavigateToLogin(context);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logoutAndNavigateToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('images/profile.png'),
            ),
            SizedBox(height: 16),
            Text(
              _name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              _email,
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Phone: $_phoneNumber',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Address: $_address',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Gender: $_gender',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Age: $_age',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final updatedData = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      name: _name,
                      email: _email,
                      phoneNumber: _phoneNumber,
                      address: _address,
                      gender: _gender,
                      age: _age,
                    ),
                  ),
                );

                if (updatedData != null && updatedData is Map<String, String>) {
                  setState(() {
                    _name = updatedData['name']!;
                    _email = updatedData['email']!;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text('Edit Profile'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement change password functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              child: Text('Change Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement delete account functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Delete Account'),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
