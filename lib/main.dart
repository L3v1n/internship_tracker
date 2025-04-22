import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repository/repository.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = InternshipRepository();
  await repository.init();
  runApp(
    RepositoryProvider.value(
      value: repository,
      child: const InternshipTrackerApp(),
    ),
  );
}
