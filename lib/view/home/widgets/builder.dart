import 'package:flutter/material.dart';
import 'package:todo/controller/homecontroller.dart';

class Buil_der extends StatefulWidget {
  const Buil_der({super.key});

  @override
  State<Buil_der> createState() => _Buil_derState();
}

class _Buil_derState extends State<Buil_der> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Home_Controller().MyList.length,
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
                    Home_Controller().MyList[index].tiltlname,
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Home_Controller().MyList[index].desc,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        Text("",style: TextStyle(color: Colors.black,fontSize: 20),),
                        IconButton(onPressed: (){
                          // Home_Controller.delete;
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
        });
  }
}
