import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:todo/view/home/widgets/showmodel.dart';

import '../../controller/homecontroller.dart';
import '../../models/notes_model.dart';
//import 'widgets/builder.dart';
import 'widgets/buttons.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  initState() {
    loadDbData();
    super.initState();
  }
  loadDbData() async {
    Home_Controller obj = Home_Controller();
    await obj.loadbox();
  }


  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
  Home_Controller obj = Home_Controller();
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('TO DO '),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          height: 800,
          color: Colors.blue,
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 670,
              child: ListView.builder(
        itemCount: obj.MyList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.grey),
              child: 
              Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 10,),
                  Text(
                    obj.MyList[index].tiltlname,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    obj.MyList[index].desc,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text("",style: TextStyle(color: Colors.black,fontSize: 20),),
                        IconButton(onPressed: (){
                          obj.delete(index);
                          setState(() {
                            
                          });
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        })
            ),
            Padding(
              padding: const EdgeInsets.only(left: 300),
              child: FloatingActionButton(onPressed: (){
                _showModel();
              },
                child: Icon(Icons.add),
                backgroundColor: Colors.red,
              ),
            )
          ]),
        ),
      ),
    );
  }
  void _showModel(){
    showModalBottomSheet(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      context: context, builder: (BuildContext)=>SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:Container(
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
                      obj.addnew(MyModel(tiltlname: _titleController.text, desc: _descriptionController.text,));
                      print(_titleController.text);
                      print(_dateController.text);
                      print(_descriptionController.text);
                      print(obj.MyList.length);
                      
                      setState(() {
                        
                      });
                      Navigator.pop(context);
                    })
              ],
            ),
          )
        ],
      ),
    )
          ),
        ),
      ));
  }
  
}
