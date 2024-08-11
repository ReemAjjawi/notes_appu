import 'package:flutter/material.dart';

class DateTimeInputField extends StatefulWidget {
  @override
  _DateTimeInputFieldState createState() => _DateTimeInputFieldState();
}

class _DateTimeInputFieldState extends State<DateTimeInputField> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth * 0.92,
              height: screenHeight / 13,
              child: TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  hintText: 'Enter the date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04),
                  errorMaxLines: 1,
                  errorStyle: TextStyle(height: 0.5),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    dateController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                    print('Selected Date: ${dateController.text}');
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: screenWidth * 0.92,
              height: screenHeight / 13,
              child: TextFormField(
                controller: startTimeController,
                decoration: InputDecoration(
                  hintText: 'Enter start time (HH:MM:SS)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04),
                  errorMaxLines: 1,
                  errorStyle: TextStyle(height: 0.5),
                  suffixIcon: Icon(Icons.access_time),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    startTimeController.text =
                        "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
                    print('Selected Start Time: ${startTimeController.text}');
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the start time';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: screenWidth * 0.92,
              height: screenHeight / 13,
              child: TextFormField(
                controller: endTimeController,
                decoration: InputDecoration(
                  hintText: 'Enter end time (HH:MM:SS)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                      horizontal: screenWidth * 0.04),
                  errorMaxLines: 1,
                  errorStyle: TextStyle(height: 0.5),
                  suffixIcon: Icon(Icons.access_time),
                ),
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    endTimeController.text =
                        "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}:00";
                    print('Selected End Time: ${endTimeController.text}');
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the end time';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String date = dateController.text;
                final String startTime = startTimeController.text;
                final String endTime = endTimeController.text;

                if (date.isNotEmpty &&
                    startTime.isNotEmpty &&
                    endTime.isNotEmpty) {
                  final startDateTimeString = "$date" + "T$startTime.928Z";
                  final endDateTimeString = "$date" + "T$endTime.928Z";

                  print('startTime: $startDateTimeString');
                  print('endTime: $endDateTimeString');

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Start Time: $startDateTimeString\nEnd Time: $endDateTimeString")),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DateTimeInputField(),
  ));
}
