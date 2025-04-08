import 'package:flutter/material.dart';
import 'package:internship_tracker/add_intern.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship Tracker',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const InternshipTracker(),
    );
  }
}

class InternshipTracker extends StatefulWidget {
  const InternshipTracker({super.key});

  @override
  State<InternshipTracker> createState() => _InternshipTrackerState();
}

class _InternshipTrackerState extends State<InternshipTracker> {
  final List<Map<String, dynamic>> _internShiftList = [
    {
      'id': 1,
      'name': 'DigiPlus Interactive',
      'internStartDate': 'March 10, 2025',
      'internEndDate': '',
      'requiredRenderHours': 480,
      'shiftDate': 'March 10, 2025',
      'shiftStartTime': '9:00 AM',
      'shiftEndTime': '9:00 PM',
      'overTimeHours': 2,
      'renderHours': 10,
    },
    {
      'id': 2,
      'name': 'DigiPlus Interactive',
      'internStartDate': 'March 11, 2025',
      'internEndDate': '',
      'requiredRenderHours': 480,
      'shiftDate': 'March 11, 2025',
      'shiftStartTime': '9:00 AM',
      'shiftEndTime': '6:00 PM',
      'overTimeHours': 0,
      'renderHours': 8,
    },
  ];

    void customSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        width: 300,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        ),
        duration: const Duration(seconds: 2),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internship Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: //_internShiftList.isEmpty ? 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: const Text(
              'You have no internship yet!',
            ),
          ),
          const SizedBox(height: 20),
        ],
      ), //:
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final update = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddIntern(),
            ),
          );
          if (update != null) {
            //_addItem(update);
          }
        },
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
        shape: CircleBorder(),
        child: Icon(
          Icons.add, 
          color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black
            : Colors.white,
        ),
      )
    );
  }
}