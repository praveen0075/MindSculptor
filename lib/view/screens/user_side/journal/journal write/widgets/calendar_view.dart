import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarViewToPickDate extends StatefulWidget {
  const CalendarViewToPickDate({super.key});

  @override
  State<CalendarViewToPickDate> createState() => _CalendarViewToPickDateState();
}

class _CalendarViewToPickDateState extends State<CalendarViewToPickDate> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: (){
        showDatePicker( 
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2050)).then((value){
          setState(() {
            date = value!;
          });
        });
      },
      color: Colors.blue,
      child:  Text(
        DateFormat('dd/MM/yyyy').format(date),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}