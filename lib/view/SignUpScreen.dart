import 'package:flutter/material.dart';
import 'package:post_api/view/HomeScreen.dart';

import '../model/SignUpModel.dart';
import '../service/SignUpUserServices.dart';

class SinUpScreen extends StatefulWidget {
  const SinUpScreen({Key? key}) : super(key: key);

  @override
  State<SinUpScreen> createState() => _SinUpScreenState();
}

class _SinUpScreenState extends State<SinUpScreen> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final passWord = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'FirstName'),
                controller: firstName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'First name cant be empty';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Lastname'),
                controller: lastName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lastname cant be empty';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                controller: userName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'user name cant be empty';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: passWord,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password cant be empty';
                  }
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // SignUpUserServices.SignUpUser(
                    //   firstname: firstName.text,
                    //   lasttname: lastName.text,
                    //   username: userName.text,
                    //   password: passWord.text,
                    // ).then(
                    //   (value) => Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => HomeScreen(),
                    //     ),
                    //   ),
                    // );
                    SingupModel model = SingupModel();
                    model.firstName = firstName.text;
                    model.lastName = lastName.text;
                    model.username = userName.text;
                    model.password = passWord.text;
                    model.avatar =
                        'https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp';

                    SignUpUserServices.signup(model.toJson()).then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
