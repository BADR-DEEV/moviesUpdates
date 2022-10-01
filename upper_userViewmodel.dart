import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class UpperUserViewModel extends BaseViewModel {
  BuildContext? context;
  String? email = '';
  String? name;

  Future<void> init(BuildContext context) async {
    this.context;
    setBusy(true);
    var prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setBusy(false);

    print(email);
  }

  Future<void> clear() async {
    var preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
