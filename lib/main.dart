import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        scaffoldBackgroundColor:const Color.fromARGB(255, 248, 233, 210),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 248, 233, 210)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = OverviewPage();
        
      case 1:
        page = ReportsPage();
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              leading: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20  ), // optional: adjust spacing
                child: SizedBox(
                  height: 40, // adjust size as needed
                  child: Image.asset('assets/logo/N3ST logo.png',fit: BoxFit.contain), // your logo path here
                ),
              ),

              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.insights),
                  label: Text('Overview', style: TextStyle(fontSize: 16),),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.equalizer_rounded),
                  label: Text('Reports', style: TextStyle(fontSize: 16),),
                ),
              
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 248, 233, 210),
              child: page,
            ),
          ),
        ],
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, Therapist!',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Recent Flags',
            style: TextStyle(fontSize: 24,
            fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FlagCard(
              image: AssetImage('assets/Profile/Kevin.png'),
              name: 'Kevin',
              status: 'For Review',
              issues: ['Stimming', 'Avoid eye contact', 'No response to name' ],
            ),
            SizedBox(width: 20), 
            FlagCard(
              image: AssetImage('assets/Profile/Calvin.png'),
              name: 'Calvin',
              status: 'For Review',
              issues: ['Repetitive movements', 'Does not share interests' ],
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
              issues: ['Stimming', 'Avoid eye contact', 'No response to name' ],
            ),
          ],),
          SizedBox(height: 20),
          Text("Children",
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.w700),),
          SizedBox(height: 10),
          ChildrenTable()  // Add more widgets here
        ],
      ),
    );
  }
}

class ReportsPage extends StatelessWidget {
  final List<Map<String, dynamic>> profiles = [
    {'image': AssetImage('assets/Profile/Kevin.png'), 'name': 'Kevin'},
    {'image': AssetImage('assets/Profile/Calvin.png'), 'name': 'Calvin'},
    {'image': AssetImage('assets/Profile/Mary.png'), 'name': 'Mary'},
    {'image': AssetImage('assets/Profile/Alan.png'), 'name': 'Alan'},
    {'image': AssetImage('assets/Profile/Vivian.png'), 'name': 'Vivian'},
    {'image': AssetImage('assets/Profile/Zetus.png'), 'name': 'Zetus'},
    {'image': AssetImage('assets/Profile/Jay.png'), 'name': 'Jay'},
    {'image': AssetImage('assets/Profile/Amanda.png'), 'name': 'Amanda'},
    // Add more profiles here if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reports',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle first button tap
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[200], // button background colour
                foregroundColor: Colors.black, // text (and icon) colour
              ),
                child: Text('Add Profile', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(width: 16), // gap between buttons
              ElevatedButton(
                onPressed: () {
                  // Handle second button tap
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[200], // button background colour
                foregroundColor: Colors.black, // text (and icon) colour
              ),
                child: Text('Search', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
          SizedBox(height: 20), // spacing after buttons
          Expanded( // takes up remaining space
            child: GridView.count(
              crossAxisCount: 4, // number of columns
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: profiles.map((profile) {
                return Profilecard(
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

class Profilecard extends StatelessWidget {
  final ImageProvider image;
  final String name;

  Profilecard({required this.image, required this.name});

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
  statusColor = Colors.grey; // default color for other statuses
}

    return Container(
      width: 250,
      height: 250,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        border: Border.all(color: statusColor, width: 2),
        borderRadius: BorderRadius.circular(12),boxShadow: [ // optional: add subtle shadow for card effect
        BoxShadow(
          color: Colors.grey,
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(2, 2),
        ),
      ],
      ),
      child: Column(
        children: [CircleAvatar(
            radius: 35,
            backgroundImage: image, // replace with your image path
            // For network image:
            // backgroundImage: NetworkImage('https://example.com/profile.jpg'),
          ),
          SizedBox(height: 8),
          Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),), // placeholder avatar
          SizedBox(height: 8),
          ...issues.map((issue) => Text("• $issue")),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withValues(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}



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
