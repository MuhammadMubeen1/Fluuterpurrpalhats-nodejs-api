// ignore_for_file: prefer_const_constructors, missing_required_param

import 'package:flutter/material.dart';

import 'color.dart';


AppBar buildNavigationBar(context, textString) {
  return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      // toolbarHeight: 65,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
        color: PRIMARY_COLOR,
        iconSize: 22,
      ),
      //  BackButton(
      //   color: PRIMARY_COLOR),
      title: Text(textString,
          style: const TextStyle(
              color: PRIMARY_COLOR,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 16.0,
              fontFamily: 'Sk-Modernist')));
}
