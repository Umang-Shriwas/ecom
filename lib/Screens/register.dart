import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constants/constant.dart';
import 'homescreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _FirstNameController = TextEditingController();
  TextEditingController _LastNameController = TextEditingController();
  String? gender;
  int id = 0;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('images/login3d.png'), fit: BoxFit.cover)),
      child: Scaffold(
          appBar: AppBar(
              title: Text("Registration Screen"),
              backgroundColor: AppColor.deepOrange,
              shadowColor: AppColor.deepOrange),
          body: Stack(
            children: [
              Container(
                  // padding: const EdgeInsets.only(left: 35, top: 130),
                  // child: const Text('Welcome\nBack',
                  //     style: TextStyle(color: Colors.red, fontSize: 33)),
                  ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(35),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onTap: () {
                          print("First Name:$_FirstNameController");
                        },
                        controller: _FirstNameController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onTap: () {
                          print("Last Name:$_LastNameController");
                        },
                        controller: _LastNameController,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          // height: MediaQuery.of(context).size.width / 3,
                          child: Center(
                              child: TextField(     
                        controller: dateInput,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'Date of Birth',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        readOnly: true,
                        onTap: () async {
                          print("date:$dateInput");
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1950), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(
                                pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(
                                formattedDate); //formatted date output using intl package =>  2021-03-16
                            setState(() {
                              dateInput.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {}
                        },
                      ))),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                          child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Radio(
                          
                                value: 1,
                                groupValue: id,
                                onChanged: (val) {
                                  print("male");
                                  setState(() {
                                    id = 1;
                                  }
                                  
                                  );
                                  gender="Male";
                                },
                              ),
                              Text(
                                'Male',
                                style: new TextStyle(fontSize: 17.0),
                              ),
                              Radio(
                                value: 2,
                                groupValue: id,
                                onChanged: (val) {
                                  print("female");
                                  setState(() {
                                    id = 2;
                                  });
                                  gender="Female";
                                },
                              ),
                              Text(
                                'Female',
                                style: new TextStyle(
                                  fontSize: 17.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const Home(),
                            //     ));

                            print("$_FirstNameController");
                            print("$_LastNameController");
                            print("$dateInput");
                            print("$gender");
                          },
                          child: Text(
                            "your Details",
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.deepOrange)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
