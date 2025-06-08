import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final List<DateTime> availableTimes;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarWidget({
    super.key,
    required this.availableTimes,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: отобразить календарь и вызвать onDateSelected при выборе даты
    return Container(
      height: 200,
      color: Colors.grey[200],
      child: const Center(child: Text('Календарь здесь')),
    );
  }
}