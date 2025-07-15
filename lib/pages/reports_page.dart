import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';

class ReportsPage extends StatelessWidget {
  ReportsPage({super.key});

  final List<Map<String, dynamic>> profiles = [
    {'image': AssetImage('assets/Profile/Kevin.png'), 'name': 'Kevin'},
    {'image': AssetImage('assets/Profile/Calvin.png'), 'name': 'Calvin'},
    {'image': AssetImage('assets/Profile/Mary.png'), 'name': 'Mary'},
    {'image': AssetImage('assets/Profile/Alan.png'), 'name': 'Alan'},
    {'image': AssetImage('assets/Profile/Vivian.png'), 'name': 'Vivian'},
    {'image': AssetImage('assets/Profile/Zetus.png'), 'name': 'Zetus'},
    {'image': AssetImage('assets/Profile/Jay.png'), 'name': 'Jay'},
    {'image': AssetImage('assets/Profile/Amanda.png'), 'name': 'Amanda'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[200],
                  foregroundColor: Colors.black,
                ),
                child: const Text('Add Profile', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[200],
                  foregroundColor: Colors.black,
                ),
                child: const Text('Search', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: profiles.map((profile) {
                return ProfileCard(
                  image: profile['image'],
                  name: profile['name'],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
