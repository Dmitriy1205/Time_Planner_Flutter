import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SfCalendar(
            view: CalendarView.month,
            showDatePickerButton: true,
            allowedViews: <CalendarView>[
              CalendarView.day,
              CalendarView.timelineMonth,
              CalendarView.week,
              CalendarView.month,
              CalendarView.schedule
            ],
            dataSource: _getCalendarDataSource(),

            timeSlotViewSettings: TimeSlotViewSettings(
              timeIntervalHeight: 50,
              timeFormat: 'k',

              startHour: 0,
              endHour: 25,
            ),
            monthViewSettings: MonthViewSettings(
              showTrailingAndLeadingDates: false,
            )),
      ),
    );
  }

  MeetingDataSource _getCalendarDataSource() {
    List<Meeting> meetings = <Meeting>[];
    meetings.add(Meeting(
        eventName: 'meeting',
        from: DateTime(2021, 01, 02, 12, 12),
        to: DateTime(2021, 01, 21, 12, 30),
        background: Colors.black,
        isAllDay: true,
        recurrenceRule: ''));
    meetings.add(Meeting(
        eventName: 'meeting',
        from: DateTime(2021, 01, 02, 12, 12),
        to: DateTime(2021, 01, 21, 12, 30),
        background: Colors.red,
        isAllDay: true,
        recurrenceRule: ''));
    meetings.add(Meeting(
        eventName: 'meeting',
        from: DateTime(2021, 01, 02, 12, 12),
        to: DateTime(2021, 01, 21, 12, 30),
        background: Colors.blueAccent,
        isAllDay: true,
        recurrenceRule: ''));
    meetings.add(Meeting(
        eventName: 'meeting',
        from: DateTime(2021, 01, 02, 12, 12),
        to: DateTime(2021, 01, 21, 12, 30),
        background: Colors.yellow,
        isAllDay: true,
        recurrenceRule: ''));
    return MeetingDataSource(meetings);
  }
}

class Meeting {
  Meeting(
      {this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.recurrenceRule});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String recurrenceRule;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  String getRecurrenceRule(int index) {
    return appointments[index].recurrenceRule;
  }
}
