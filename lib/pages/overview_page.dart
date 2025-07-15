import 'package:flutter/material.dart';
import '../widgets/flag_card.dart';
import '../widgets/children_table.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Hello, Therapist!',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          const Text('Recent Flags', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              FlagCard(
                image: AssetImage('assets/Profile/Kevin.png'),
                name: 'Kevin',
                status: 'For Review',
                issues: ['Stimming', 'Avoid eye contact', 'No response to name'],
              ),
              SizedBox(width: 20),
              FlagCard(
                image: AssetImage('assets/Profile/Calvin.png'),
                name: 'Calvin',
                status: 'For Review',
                issues: ['Repetitive movements', 'Does not share interests'],
              ),
              SizedBox(width: 20),
              FlagCard(
                image: AssetImage('assets/Profile/Vivian.png'),
                name: 'Vivian',
                status: 'Verified',
                issues: ['Stimming'],
              ),
              SizedBox(width: 20),
              FlagCard(
                image: AssetImage('assets/Profile/Alan.png'),
                name: 'Alan',
                status: 'For Review',
                issues: ['Stimming', 'Avoid eye contact', 'No response to name'],
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Children", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          ChildrenTable(),
        ],
      ),
    );
  }
}
