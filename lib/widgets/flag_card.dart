import 'package:flutter/material.dart';

class FlagCard extends StatelessWidget {
  final ImageProvider image;
  final String name;
  final String status;
  final List<String> issues;

  const FlagCard({
    super.key,
    required this.image,
    required this.name,
    required this.status,
    required this.issues,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    if (status == 'Verified') {
      statusColor = const Color.fromRGBO(191, 240, 219, 1);
    } else if (status == 'For Review') {
      statusColor = const Color.fromRGBO(242, 198, 197, 1);
    } else {
      statusColor = Colors.grey;
    }

    return Container(
      width: 250,
      height: 250,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: statusColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 4, offset: Offset(2, 2))],
      ),
      child: Column(
        children: [
          CircleAvatar(radius: 35, backgroundImage: image),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          ...issues.map((issue) => Text("• $issue")),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
