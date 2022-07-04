import 'package:ecom/Screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../constants/constant.dart';


class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);
  

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _Name = TextEditingController();
  final _phoneNumber = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Center(child: Text("SignUp Screen")),
        backgroundColor: AppColor.deepOrange ,
      ) ,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const SizedBox(height: 175,),
                Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Sign Up Here',
                            style: TextStyle(fontSize: 20),
                          ),
              
                
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _Name,
                            validator: (value) =>
                                (value!.isEmpty) ? "Enter Your Name" : null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                      ),
                    ),
                  ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (value) => EmailValidator.validate(value!)
                                ? null
                                : "Please enter valid email",
                            controller: _emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'E-mail',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                              controller: _phoneNumber,
                              validator:
                               (value) => value!.isEmpty ? "Enter Your Phone Number": null,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Enter Phone Number',
                                  border: const OutlineInputBorder(),
                                    ),
                    ),
                  ),
                  
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      controller: _passwordController,
                            validator: (value) =>
                                value!.isEmpty ? "Enter some text" : null,
                            obscureText: true,
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: AppColor.deepOrange),
                      child: const Text('Sign Up'),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Login()));
                                        print('form is validated');
                                      } else {
                                        print('form is not validated');
                                      }
                      },
                    )
                ),
              ],
            ),
          ),
        )
      ), 
    ),);
      
    
  }
}