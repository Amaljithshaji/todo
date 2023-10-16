import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:todo/controller/homecontroller.dart';
import 'package:todo/models/notes_model.dart';

import 'buttons.dart';

class Showmodel extends StatefulWidget {
  const Showmodel({super.key});

  @override
  State<Showmodel> createState() => _ShowmodelState();
  
}

class _ShowmodelState extends State<Showmodel> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
Home_Controller obj = Home_Controller();

  void _showDatePicker(BuildContext context) async {
    // Hide the keyboard if it is shown
    FocusScope.of(context).requestFocus(FocusNode());

    // Get the selected date from the date picker
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    // If the user selected a date, update the text field with the formatted date
    if (selectedDate != null) {
      setState(() {
        // Use the intl package to format the date
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  // name = _titleController.text;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: TextFormField(
              controller: _descriptionController,
              maxLines: 10,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
                  hintText: 'Descprition',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                setState(() {
                  //  dep = _descriptionController.text;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey,
            ),
            child: TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                  hintText: 'Enter Date',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      icon: Icon(Icons.date_range))),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Buttonz(
                  btname: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Buttonz(
                    btname: 'Save',
                    onPressed: () {
                      obj.addnew(MyModel(tiltlname: _titleController.text, desc: _descriptionController.text));
                      print(_titleController.text);
                      print(_dateController.text);
                      print(_descriptionController.text);
                      print(Home_Controller().MyList.length);
                      setState(() {
                        
                      });
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
