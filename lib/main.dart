import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/models/notes_model.dart';
import 'view/home/home.dart';


Future<void> main()  async {
  await Hive.initFlutter();
  
  var box = await Hive.openBox('notbox');

  
  Hive.registerAdapter(MyModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Home(),);
  }
}