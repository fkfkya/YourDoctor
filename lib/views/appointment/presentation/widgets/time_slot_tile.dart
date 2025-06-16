import 'package:flutter/material.dart';
import '../../data/models/availability_model.dart';

class TimeSlotTile extends StatelessWidget {
  final AvailableTime time;
  final bool selected;
  final VoidCallback onTap;

  const TimeSlotTile({
    super.key,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            color: selected ? Colors.blue.shade200 : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? Colors.blue : Colors.grey.shade300,
              width: 1.5,
            ),
          ),
          child: Text(
            time.time,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
