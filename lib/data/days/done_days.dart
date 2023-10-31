import 'package:school_accounting_assistant/data/days/entity/doneD_day.dart';

class DoneDays {
  List<DoneDay> doneDays = [];
  DoneDays._privateConstructor();

  static final DoneDays _instance = DoneDays._privateConstructor();

  factory DoneDays() {
    return _instance;
  }
}
