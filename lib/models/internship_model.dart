import 'package:hive/hive.dart';

part 'internship_model.g.dart';

@HiveType(typeId: 0)
final class InternshipModel extends HiveObject {
  @HiveField(0)
  late String companyName;
  
  @HiveField(1)
  late DateTime startDate;
  
  @HiveField(2)
  late int requiredHours;
  
  InternshipModel({
    required this.companyName,
    required this.startDate,
    required this.requiredHours,
  });
}