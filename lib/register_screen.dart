import 'package:flutter/material.dart';
import 'package:kode_camp_task_four/app_validators.dart';
import 'package:kode_camp_task_four/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //👇 GLOBAL FORM KEY
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // 👇 TEXT EDITING CONTROLLERS
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwardController = TextEditingController();
  final TextEditingController _confirmpasswardController =
      TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _fullnameController.dispose();
    _phoneNumberController.dispose();
    _passwardController.dispose();
    _confirmpasswardController.dispose();
    _birthdateController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 208, 197, 201),

        //App bar section
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.teal,
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/thumbnails/052/793/073/small/chef-logo-design-vector.jpg',
                    width: 35,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 10),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'NAME',
                        hintText: 'Enter your full name',
                        controller: _fullnameController,
                        obscuretext: false,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        label: 'EMAIL',
                        hintText: 'Enter your email number',
                        controller: _emailController,
                        obscuretext: false,
                        validator: validateEmail,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        label: 'PHONE NO.',
                        hintText: 'Enter your phone number',
                        controller: _phoneNumberController,
                        obscuretext: false,
                        validator: validatePhone,
                      ),

                      SizedBox(height: 12),
                      CustomTextField(
                        label: 'PASSWORD',
                        hintText: 'Enter your Password',
                        controller: _passwardController,
                        obscuretext: true,
                        validator: validatePassword,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        label: 'CONFIRM PASSWORD',
                        hintText: 'Re-enter your password',
                        controller: _confirmpasswardController,
                        obscuretext: true,
                        validator: validatePassword,
                      ),
                      SizedBox(height: 12),
                      CustomTextField(
                        label: 'BIRTH DATE',
                        hintText: 'Enter your birth date',
                        controller: _birthdateController,
                        obscuretext: false,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 70),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(
                              name: _fullnameController.text,
                              email: _emailController.text,
                            ),
                          ),
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
          ),
        ),
      ),
    );
  }
}
