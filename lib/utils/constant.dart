// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const fontRegular = 'Regular';
const fontMedium = 'Medium';
const fontSemibold = 'Semibold';
const fontBold = 'Bold';
/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSmalest = 10.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 14.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;
const FontStyle12 = FontStyle.normal;
var userName = "Tenant";
//BASEuRL
// const base_url = "https://hr-expert-api-ingress-58884725.ap-southeast-2.elb.amazonaws.com/api/v1/";
const BaseURL = "https://admin.purplehats.com/api";
//"https://mkjnpq1ty4.execute-api.ap-south-1.amazonaws.com/pro/";
//"https://mkefn47qx3.execute-api.ap-southeast-1.amazonaws.com/pro/";
Widget titleForDialog(BuildContext context, String title) {
  return Container(
    color: Theme.of(context).primaryColor,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    child: Center(
      child: Text(title,
          style: const TextStyle(color: Colors.white, fontSize: 17, height: 1.55), textAlign: TextAlign.center),
    ),
  );
}
