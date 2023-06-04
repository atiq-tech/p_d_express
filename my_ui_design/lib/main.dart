import 'package:flutter/material.dart';
import 'package:my_ui_design/add_newPpages/add_new_project.dart';
import 'package:my_ui_design/add_newPpages/project_details_page.dart';
import 'package:my_ui_design/all_pages/home_page.dart';
import 'package:my_ui_design/all_pages/login_page9.dart';
import 'package:my_ui_design/screen/pageviewdemo_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      //home: PageViewDemo(),
      // home: AddNewProject(),
      // home: ProjectDetailsPage(),
    );
  }
}
