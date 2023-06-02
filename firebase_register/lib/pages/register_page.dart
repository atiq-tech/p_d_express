import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_register/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future addUser() async {
    CollectionReference _users =
        await FirebaseFirestore.instance.collection("register");
    _users.add(({
      "name": _nameController.text,
      "phone": _phoneController.text,
      "age": _ageController.text,
      "address": _addressController.text
    }));
    _nameController.clear();
    _phoneController.clear();
    _ageController.clear();
    _addressController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 228),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 243, 247, 194),
          title: Text(
            "Registation Form",
            style: TextStyle(
                color: Color.fromARGB(255, 1, 43, 30),
                fontWeight: FontWeight.w900,
                fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: "Enter your name",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 189, 4, 142),
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 31, 1, 23),
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: "Phone",
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 31, 1, 23),
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                      hintText: "Enter your phone number",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 189, 4, 142),
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 31, 1, 23),
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                      hintText: "Enter your age",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 189, 4, 142),
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: _addressController,
                  decoration: InputDecoration(
                      labelText: "Address",
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 31, 1, 23),
                          fontWeight: FontWeight.w900,
                          fontSize: 18),
                      hintText: "Enter your address",
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 189, 4, 142),
                          fontWeight: FontWeight.w900,
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      )),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 239, 247, 173),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                    onPressed: () {
                      addUser();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                          color: Color.fromARGB(255, 1, 66, 46),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )),
              ],
            ),
          ),
        ));
  }
}
