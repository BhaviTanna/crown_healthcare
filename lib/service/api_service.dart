import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> loginCheck(BuildContext context,
    {required String email, required String password}) async {
  try {
    var res = await http.post(
      Uri.parse('https://testbackend.sk8gym.com/api/auth/login/user/v1'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
        "deviceId": "93FCCA55-9E8B-4A13-8ADA-593C8CAC574B",
        "fcmToken":
            "fXlhjM6xs0CAvXK24ub-EX:APA91bH-MHLnj4HyTXmqAVX_Wp0Am23v5terfbFTIAoHW6V4rWpXeKVQi1FjBcfXSFm9gcekVa-mpjmnfOUbMv7_j0Utw4Dd0dFK5t9kOptLex9fqIhR-wma4r3kPNkKshE_LtJVk9Fu",
        "deviceCompany": "Apple - iPhone 13",
        "deviceName": "iPhone",
        "os": "ios",
        "appVersion": "1.0.5",
        "osVersion": "15.0"
      }),
    );

    if (res.statusCode == 201) {
      final responseBody = json.decode(res.body);
      print(responseBody['status']);
      if (responseBody['success'] == true) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Correct Credentials!'),
              content: const Text('Login Successfully'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        print(res.statusCode);
        _showMyDialog(context);
      }
    } else {
      _showMyDialog(context);
    }
  } catch (e) {
    print('Error: $e');
    _showMyDialog(context);
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('An error occurred. Please try again.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
