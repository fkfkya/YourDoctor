import 'package:flutter/material.dart';

class TimeSlotTile extends StatelessWidget {
  final DateTime time;
  final bool isSelected;
  final VoidCallback onTap;

  const TimeSlotTile({
    super.key,
    required this.time,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final formatted =
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    return ListTile(
      title: Text(formatted),
      tileColor: isSelected ? Colors.blue[100] : null,
      onTap: onTap,
    );
  }
}