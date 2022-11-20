import 'package:dev_hack/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';

import 'PageManager.dart';

//import 'PageManager.dart';

class LoginScreen extends StatefulWidget {
  static const routName = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var rememberValue = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: Stack(
            children: [
              Container(
                child: Column(
                    children: [Container(
                      child: Image.asset('assets/sus.png'),
                    ),
                    ]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      SizedBox(height: height * 0.35,),
                      Container(child: Image.asset('assets/dreapta.png'),),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Image.asset('assets/jos.png'),
                  ),
                ],
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(height: height * 0.2),
                          Container(
                              height: 0.2 * height,
                              child: Image.asset('assets/logoclinica.png')),
                          SizedBox(height: height * 0.05),
                          Container(
                            child: Text("Let's get you in",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(height: height * 0.05),
                          Container(
                            width: 0.8 * width,
                            child: Column(
                              children: [
                                TextFormField(
                                  // validator: (value) => EmailValidator.validate(value!)
                                  //     ? null
                                  //     : 'Invalid email address',
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: const Icon(Icons.email),
                                    filled: true,
                                    fillColor: Color(0xFF758ECD).withOpacity(0.2),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  controller: emailController,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    return null;
                                  },
                                  maxLines: 1,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFF758ECD).withOpacity(0.2),
                                    prefixIcon: const Icon(Icons.lock),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  controller: passwordController,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                var Response = LoginUser(emailController.text, passwordController.text);
                                var response;
                                await Response.loginUser().then((value) => response = value);
                                print(response);
                                if (response == LoginResponse.LoignSuccessful){
                                  Navigator.pushNamed(context, PageManager.routName);
                                }
                                else if (response == LoginResponse.LoginError){
                                  showDialog(context: context,
                                      builder: (context){
                                        return AlertDialog(
                                          title: Text(
                                            "Wrong credentials!",
                                            style: TextStyle(fontSize: 24.0),
                                          ),
                                        );
                                      });
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {

                                    return Color.fromRGBO(240,101,67, 1);
                                  },
                                ),

                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Color.fromRGBO(240,101,67, 1))
                                  ),
                                ),
                              ),
                              child: Text("Log in")
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }
}