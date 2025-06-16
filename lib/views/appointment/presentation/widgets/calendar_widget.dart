import 'package:flutter/material.dart';

typedef DateCallback = void Function(DateTime date);

class CalendarWidget extends StatelessWidget {
  final List<DateTime> availableDates;
  final DateCallback onDateSelected;

  const CalendarWidget({
    super.key,
    required this.availableDates,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: availableDates.length,
        itemBuilder: (context, index) {
          final date = availableDates[index];
          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 70,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}/${date.month}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${date.year}',
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}