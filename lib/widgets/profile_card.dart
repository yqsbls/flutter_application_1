import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final ImageProvider image;
  final String name;

  ProfileCard({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255), // example card colour
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: image,
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Handle View Profile
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(250, 223, 193, 1), // button background colour
                foregroundColor: Colors.black, // text (and icon) colour
              ),
              child: Text('View Profile'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Add Report
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(191, 240, 219, 1), // button background colour
                foregroundColor: Colors.black, // text (and icon) colour
              ),
              child: Text('Add Report'),
            ),
          ],
        ),
      ),
    );
  }
}