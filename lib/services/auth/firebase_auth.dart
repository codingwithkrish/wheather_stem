import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheather_stem/view/snakbar.dart';

import '../../view/auth/otp.dart';

class FirebaseAuthService extends GetxController {
  final _auth = FirebaseAuth.instance;
  String verificationId = "";
  Future<bool> sendOtp(String phoneNumber) async {
    bool isSent = false;
    try {
      // Send OTP to the phone number
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          throw Exception(e.message.toString());
        },
        codeSent: (String verificationId, int? resendToken) async {
          log("Otp Sent");
          log(verificationId, name: 'OTP');
          this.verificationId = verificationId;
          Navigator.push(Get.context!,
              MaterialPageRoute(builder: (builder) => OtpCheck()));
          isSent = true;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return isSent;
    } on FirebaseAuthException catch (e) {
      log("Error: ${e.code}");
      showSnakBar(e.toString());
      return false;
    }
  }

  Future<bool> veryfyotp(String otp) async {
    if (otp.length == 6) {
      try {
        AuthCredential phoneAuthCredential = await PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: otp);
        final authCred = await _auth.signInWithCredential(phoneAuthCredential);
        log("Done");
        log(authCred.user.toString());
        return true;
      } on FirebaseAuthException catch (e) {
        log(e.message.toString());
      }
    } else {
      return false;
    }
    return false;
  }
}
