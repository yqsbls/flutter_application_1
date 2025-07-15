import 'package:flutter/material.dart';
import 'pages/overview_page.dart';
import 'pages/reports_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Namer App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 248, 233, 210),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 248, 233, 210)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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
        throw UnimplementedError('No widget for $selectedIndex');
    }
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: NavigationRail(
              extended: true,
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  height: 40,
                  child: Image.asset('assets/logo/N3ST logo.png', fit: BoxFit.contain),
                ),
              ),
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.insights),
                  label: Text('Overview', style: TextStyle(fontSize: 16)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.equalizer_rounded),
                  label: Text('Reports', style: TextStyle(fontSize: 16)),
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
