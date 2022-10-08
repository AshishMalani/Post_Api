import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:post_api/model/SignInModel.dart';
import 'package:post_api/view/HomeScreen.dart';

import '../service/SignInService.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool lodding = false;
  final username = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: lodding == true
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInLeft(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Username'),
                        controller: username,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'user name cant be empty';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FadeInRight(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Password'),
                        controller: password,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cant be empty';
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    JelloIn(
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            lodding = true;
                          });
                          if (formKey.currentState!.validate()) {
                            SignInModel model = SignInModel();
                            model.username = username.text;
                            model.password = password.text;

                            bool status =
                                await SignInService.SigninUser(model.toJson());

                            if (status == true) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            } else {
                              setState(() {
                                lodding = false;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid username or password"),
                                ),
                              );
                            }
                          }
                        },
                        child: Text('Signup'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
