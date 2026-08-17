import 'package:flutter/material.dart';
import 'app_validators.dart';
//import 'package:task_four/the_main_screen.dart';
//import 'package:task_four/register_screen.dart';

class LoginScreen extends StatefulWidget {
  final String? name;
  final String? email;
  const LoginScreen({this.name, this.email, super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailorphoneController = TextEditingController();
  final TextEditingController _passwardController = TextEditingController();
  final String inputName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 208, 197, 201),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      //the main body
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50),

              //logo
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.teal,
                child: Image.network(
                  'https://static.vecteezy.com/system/resources/thumbnails/052/793/073/small/chef-logo-design-vector.jpg',
                  width: 35,
                  height: 35,
                  fit: BoxFit.fill,
                ),
              ),

              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomTextField(
                      label: 'EMAIL/PHONE NUMBER',
                      hintText: 'Enter your phone number or email',
                      controller: _emailorphoneController,
                      obscuretext: false,
                      validator: validateemailorPhone,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      label: 'PASSWARD',
                      hintText: 'Enter your passward',
                      controller: _passwardController,
                      obscuretext: true,
                      validator: validatePassword,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //link to the register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('don\'t have an account?'),
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/RegisterScreen');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.teal[800]),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 150),

              //Buttom Elevated botton
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_emailorphoneController.text.isEmpty ||
                            _passwardController.text.isEmpty ||
                            widget.name == null ||
                            widget.email == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You haven\'t registered, register and fill all fields correctly',
                              ),
                            ),
                          );
                          return;
                        }
                        Navigator.pushReplacementNamed(
                          context,
                          '/mainScreen',
                          arguments: {
                            'name': widget.name,
                            'email': widget.email,
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0,
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            //
          ),
        ),
      ),
    );
  }
}

//creating a reusable customTextField widget
class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final bool obscuretext;
  //final String _email;
  //final String _password;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.obscuretext,
    //required this._email,
    //required this._password,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String inputText = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2, left: 20),
          child: Text(
            widget.label,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          onChanged: (value) {
            setState(() {
              inputText = value;
            });
          },
          obscureText: widget.obscuretext,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10, // reduce this value
            ),
            hintStyle: const TextStyle(color: Color.fromARGB(255, 88, 88, 88)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            isDense: true,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
