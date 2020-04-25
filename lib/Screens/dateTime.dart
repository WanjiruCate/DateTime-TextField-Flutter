import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TrialDate extends StatefulWidget {
  @override
  _TrialDateState createState() => _TrialDateState();
}

class _TrialDateState extends State<TrialDate> {
  TextEditingController dateStart = TextEditingController();
  TextEditingController dateEnd = TextEditingController();
  TextEditingController dateStop = TextEditingController();
  TextEditingController timeStart = TextEditingController();
  TextEditingController timeEnd = TextEditingController();

  Future startDate() async {
    DateTime date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    var formatStartDate = new DateFormat('EEE, M/d/y').format(date);

    dateStart.text = formatStartDate;

    print('Start : ' + formatStartDate);
  }

  Future endTime() async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(context).requestFocus(new FocusNode());

    time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    timeEnd.text = time.format(context);
    print('Time ' + timeEnd.text);
  }

  Future startTime() async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(context).requestFocus(new FocusNode());

    time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

    timeStart.text = time.format(context);
    print('Time ' + timeStart.text);
  }

  Future endDate() async {
    DateTime date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    //dateEnd.text = date.toIso8601String();
    var formatEndDate = new DateFormat('EEE, M/d/y').format(date);
    dateEnd.text = formatEndDate;
    print('End : ' + formatEndDate);
  }

  Future stopDate() async {
    DateTime date = DateTime(1900);
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    var formatStopDate = new DateFormat('EEE, M/d/y').format(date);
    dateStop.text = formatStopDate;

    // dateStop.text = date.toIso8601String();
    print('Stop : ' + formatStopDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Date Trial'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: dateStart,
              decoration: InputDecoration(
                labelText: "Event Start Date",
                hintText: "Ex. Insert your start date",
              ),
              onTap: () async {
                startDate();
              },
            ),
            TextFormField(
              controller: dateEnd,
              decoration: InputDecoration(
                labelText: "Event End Date",
                hintText: "Ex. Insert your end date",
              ),
              onTap: () async {
                endDate();
              },
            ),
            TextFormField(
              controller: dateStop,
              decoration: InputDecoration(
                labelText: "Event Stop Date",
                hintText: "Ex. Insert your stop date",
              ),
              onTap: () async {
                stopDate();
              },
            ),
            TextFormField(
              controller: timeStart,
              decoration: InputDecoration(
                labelText: "Event Start TIme",
                hintText: "Ex. Insert your start time",
              ),
              onTap: () async {
                startTime();
              },
            ),
            TextFormField(
              controller: timeEnd,
              decoration: InputDecoration(
                labelText: "Event End TIme",
                hintText: "Ex. Insert your end time",
              ),
              onTap: () async {
                endTime();
              },
            ),
          ],
        ),
      ),
    );
  }
}
