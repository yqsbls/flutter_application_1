import 'package:flutter/material.dart';

class ChildrenTable extends StatelessWidget {
  final List<Map<String, String>> children = [
    {
      'name': 'Zetus',
      'therapy': 'OT 25/6/2025',
      'nextSession': '13 Days',
      'progress': '4 months',
      'activity': 'Motor Skill',
      'image': 'assets/Profile/Zetus.png',
    },
    {
      'name': 'Mary',
      'therapy': 'ST 25/6/2025',
      'nextSession': '21 Days',
      'progress': '5 months',
      'activity': 'Speech Skill',
      'image': 'assets/Profile/Mary.png'
    },
    {
      'name': 'Alan',
      'therapy': 'ET 25/5/2025',
      'nextSession': '23 Days',
      'progress': '3 months',
      'activity': 'Social Skill',
      'image': 'assets/Profile/Alan.png'
    },
    {
      'name': 'Vivian',
      'therapy': 'ST 26/4/2025',
      'nextSession': '24 Days',
      'progress': '6 months',
      'activity': 'Speech Skill',
      'image': 'assets/Profile/Vivian.png'
    },
    {
      'name': 'Calvin',
      'therapy': 'OT 25/6/2025',
      'nextSession': '31 Days',
      'progress': '8 months',
      'activity': 'Motor Skill',
      'image': 'assets/Profile/Calvin.png'
    },
    {
      'name': 'Kevin',
      'therapy': 'ET 25/6/2025',
      'nextSession': '45 Days',
      'progress': '7 months',
      'activity': 'Social Skill',
      'image': 'assets/Profile/Kevin.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1500,
      height: 400,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(16), // 👈 set your desired corner radius here
      boxShadow: [ // optional: add subtle shadow for card effect
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(3, 3),
        ),
      ],
    ),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
          DataColumn(label: Text('Latest Therapy', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
          DataColumn(label: Text('Next Session', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
          DataColumn(label: Text('Progress Report', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
          DataColumn(label: Text('Follow Up Activities', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
        ],
        rows: children.map((child) {
          return DataRow(cells: [
            DataCell(Row(
              children: [
                CircleAvatar(radius: 20,
               backgroundImage: AssetImage(child['image']!),), // placeholder avatar
                SizedBox(width: 8),
                Text(child['name']!,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              ],
            )),
            DataCell(Text(child['therapy']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
            DataCell(Text(child['nextSession']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
            DataCell(Text(child['progress']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
            DataCell(Text(child['activity']!,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
          ]);
        }).toList(),
      ),
    );
  }
}
