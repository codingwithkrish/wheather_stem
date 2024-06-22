import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/view/auth/otp.dart';

import '../../services/auth/firebase_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneController = TextEditingController();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                maxLines: 1,
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Enter your number',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: double.infinity,
                child: isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: () async {
                          // Send OTP

                          setState(() {
                            isLoading = true;
                          });
                          final auth = Get.put(FirebaseAuthService());

                          bool check =
                              await auth.sendOtp("+91" + _phoneController.text);

                          if (check) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => OtpCheck()));
                          }
                        },
                        child: Text('Send OTP'),
                      ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
