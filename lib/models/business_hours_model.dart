class BusinessHoursModel {
  final String day;
  final List<String> timeSet;
  bool isSelected;
  BusinessHoursModel({
    required this.day,
    required this.timeSet,
    this.isSelected = false,
  });
}

class TimeSet {
  final String slot;
  bool active;

  TimeSet({required this.slot, required this.active});
}
