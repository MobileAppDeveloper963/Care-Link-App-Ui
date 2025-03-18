import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Calendar", style: TextStyle(fontSize: 22))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Colors.blue.shade50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle:
                  HeaderStyle(formatButtonVisible: false, titleCentered: true),
              calendarStyle: CalendarStyle(
                selectedDecoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                todayDecoration: BoxDecoration(
                    color: Colors.blue.shade200, shape: BoxShape.circle),
                markerDecoration:
                    BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              ),
            ),
          ),
        ).fadeIn(),
      ),
    );
  }
}
