import '../controller/date_picker_controller.dart';
import '../../widget/text_widget.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final DatePickerController controller = Get.put(DatePickerController());

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({Key? key}) : super(key: key);

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  TimeOfDay? selectedTime;

  Future<void> _pickTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  String formatTime(TimeOfDay time) {
    DateTime dateTime = DateTime(2022, 1, 1, time.hour, time.minute);
    String formattedTime = DateFormat("h:mm a").format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(titleText: 'Date Time Picker',
          fontSize: 25, textColor: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickTime();
                },
                child: TextWidget(titleText: 'Pick Time',
                    fontSize: 20, textColor: Colors.black)
              ),
              selectedTime == null ?
              TextWidget(titleText: 'Pick a time',
                  fontSize: 20, textColor: Colors.black) :
              TextWidget(titleText: '${formatTime(selectedTime!)}',
                  fontSize: 20, textColor: Colors.black),
            ],
          ),
          SizedBox(height: screenHeight* 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child:
                TextWidget(titleText: 'Pick Date',
                    fontSize: 20, textColor: Colors.black)
              ),
              Obx(() => TextWidget(
                  titleText: '${controller.formattedDate.isEmpty ? "Pick Date" : controller.formattedDate}',
                  fontSize: 20, textColor: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? formattedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: controller.selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      controller.selectedDate.value = pickedDate;
      String inputDateString = "2023-11-23 00:00:00.000";
      DateTime inputDate = DateTime.parse(inputDateString);
      formattedDate = DateFormat('dd-MM-yyyy').format(inputDate);
      print('selectedDate ${controller.selectedDate.value}');
      print('formattedDate ${formattedDate}');
    }
  }
}
