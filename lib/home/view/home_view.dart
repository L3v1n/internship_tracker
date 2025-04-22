import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InternshipTracker extends StatefulWidget {
  const InternshipTracker({super.key});

  @override
  State<InternshipTracker> createState() => _InternshipTrackerState();
}

class _InternshipTrackerState extends State<InternshipTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internship Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: const Text('You have no internships yet!')),
            const SizedBox(height: 20),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final update = await context.push('/add_intern');
          if (update != null) {}
        },
        backgroundColor:
            Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
        ),
      ),
    );
  }
}
