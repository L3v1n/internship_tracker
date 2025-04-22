import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../../models/internship_model.dart';

final class InternshipRepository {
  static const String _boxName = 'internships';

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(InternshipModelAdapter());
    await Hive.openBox<InternshipModel>(_boxName);
  }

  Future<void> addInternship(InternshipModel internship) async {
    final box = Hive.box<InternshipModel>(_boxName);
    await box.add(internship);
  }

  List<InternshipModel> getAllInternships() {
    final box = Hive.box<InternshipModel>(_boxName);
    return box.values.toList();
  }
}
