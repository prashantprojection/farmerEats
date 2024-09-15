import '../models/business_hours_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final businessHoursControllerProvider =
    StateNotifierProvider<BusinessHoursController, List<BusinessHoursModel>>(
        (ref) => BusinessHoursController());

class BusinessHoursController extends StateNotifier<List<BusinessHoursModel>> {
  BusinessHoursController()
      : super([
          BusinessHoursModel(day: 'Monday', timeSet: []),
          BusinessHoursModel(day: 'Tuesday', timeSet: []),
          BusinessHoursModel(day: 'Wednesday', timeSet: []),
          BusinessHoursModel(day: 'Thursday', timeSet: []),
          BusinessHoursModel(day: 'Friday', timeSet: []),
          BusinessHoursModel(day: 'Saturday', timeSet: []),
          BusinessHoursModel(day: 'Sunday', timeSet: []),
        ]);

  void toggleDaySelection(String day) {
    state = state.map((model) {
      if (model.day == day) {
        return BusinessHoursModel(
          day: model.day,
          timeSet: model.timeSet,
          isSelected: !model.isSelected,
        );
      }
      return model;
    }).toList();
  }
}

final timeSetControllerProvider =
    StateNotifierProvider<TimeSetController, List<TimeSet>>(
        (ref) => TimeSetController());

class TimeSetController extends StateNotifier<List<TimeSet>> {
  TimeSetController()
      : super([
          TimeSet(slot: "8:00am - 10:00am", active: false),
          TimeSet(slot: "10:00am - 1:00pm", active: false),
          TimeSet(slot: "1:00pm - 4:00pm", active: false),
          TimeSet(slot: "4:00pm - 7:00pm", active: false),
          TimeSet(slot: "7:00pm - 10:00pm", active: false)
        ]);

  void switchSelection(int index) {
    final List<TimeSet> newState = List.from(state);
    newState[index] = TimeSet(
      slot: newState[index].slot,
      active: !newState[index].active,
    );
    state = newState;
  }
}
