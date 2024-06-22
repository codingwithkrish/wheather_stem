import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/services/local/shared_prefence.dart';
import 'package:wheather_stem/view/home/home_screen.dart';

import '../../services/auth/firebase_auth.dart';

class OtpCheck extends StatefulWidget {
  const OtpCheck({super.key});

  @override
  State<OtpCheck> createState() => _OtpCheckState();
}

class _OtpCheckState extends State<OtpCheck> {
  TextEditingController _otpController = TextEditingController();
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
            Text('OTP Verification',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              maxLines: 1,
              controller: _otpController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Enter OTP',
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
                        // Verify OTP
                        setState(() {
                          isLoading = true;
                        });
                        FirebaseAuthService auth =
                            Get.find<FirebaseAuthService>();
                        final isVerified =
                            await auth.veryfyotp(_otpController.text);
                        if (isVerified) {
                          LocalStoreage _localStoreage =
                              Get.put(LocalStoreage());
                          await _localStoreage.setLogin(true);
                          Get.offAll(HomeScreen());
                        }
                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: Text('Verify OTP'),
                    ),
            ),
          ],
        ),
      ),
    )));
  }
}
