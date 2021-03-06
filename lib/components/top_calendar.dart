import 'package:flutter/material.dart';

import '../constants.dart';

class TopCalendar extends StatefulWidget {
  final ValueChanged<DateTime> parentAction;

  TopCalendar({required this.parentAction});

  @override
  _TopCalendarState createState() => _TopCalendarState();
}

class _TopCalendarState extends State<TopCalendar> {
  int weekDay = DateTime.now().weekday;
  DateTime date = DateTime.now();
  Map<String, DateTime?> days = {
    'Mon': null,
    'Tue': null,
    'Wed': null,
    'Thu': null,
    'Fri': null,
    'Sat': null,
    'Sun': null
  };

  static const List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  void adjustDateCard() {
    int i = 1;
    for (var k in days.keys) {
      setState(() {
        //iterate through keys of the map 'days'
        //assign values of the keys as i(1 for monday, 2 for tuesday...) - today's number in week
        //in case user wants to see previous or future weeks
        days[k] = date.add(Duration(days: i - weekDay));
        i++;
      });
    }
  }

  DateTime selectDay(int day, int month, int year) {
    setState(() {
      date = DateTime(year, month, day);
    });
    return date;
  }

  @override
  void initState() {
    super.initState();
    adjustDateCard();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  date = date.subtract(const Duration(days: 7));
                  adjustDateCard();
                  widget.parentAction(date);
                });
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
            Text(
              '${months[date.month - 1]}, ${date.year}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextButton(
              style: TextButton.styleFrom(primary: Colors.black),
              onPressed: () {
                setState(() {
                  date = date.add(Duration(days: 7));
                  adjustDateCard();
                  widget.parentAction(date);
                });
              },
              child: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: days.entries.map((e)=> Expanded(child:Center(
            child: Text(
              e.key,
              style: kSubTitleStyle.copyWith(
                  color: Colors.black,fontSize: 16 ),
            ),
          ),)).toList(),
        ),

        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffD6D6D6),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: days.entries
                  .map((e) => Expanded(
                child: Column(
                  children: [
                    days.values.toList()[weekDay - 1]!.day !=
                        e.value!.day ? TextButton(
                      onPressed: () {
                        DateTime selectedDate =
                        selectDay(e.value!.day, e.value!.month, e.value!.year);
                        widget.parentAction(selectedDate);
                        setState(() {
                          date = selectedDate;
                          weekDay = selectDay(
                              e.value!.day, e.value!.month, e.value!.year)
                              .weekday;
                        });
                      },
                      child: Text(
                        '${e.value!.day}',
                        style: kSubTitleStyle.copyWith(
                            color: days.values.toList()[weekDay - 1]!.day ==
                                e.value!.day
                                ? Colors.white
                                : Colors.black),
                      ),
                    ):
                    Padding(
                      padding: const EdgeInsets.only(top: 1,bottom: 1),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        onPressed: () {
                          DateTime selectedDate =
                          selectDay(e.value!.day, e.value!.month, e.value!.year);
                          widget.parentAction(selectedDate);
                          setState(() {
                            date = selectedDate;
                            weekDay = selectDay(
                                e.value!.day, e.value!.month, e.value!.year)
                                .weekday;
                          });
                        },
                        child: Text(
                          '${e.value!.day}',
                          style: kSubTitleStyle.copyWith(
                              color: Colors.blueAccent),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

