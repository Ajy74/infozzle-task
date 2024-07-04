import 'package:flutter/material.dart';
import 'package:infozzle_task/configs/color/color.dart';
import 'package:infozzle_task/utils/custom_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> checkUrl(String url,BuildContext context) async {
  final Uri uri = Uri.parse(url);
  try {
    if (!await launchUrl(uri)) {
      customSnackBar(context, "Could not launch $url", AppColor.redColor);
    }
  } catch (e) {
    customSnackBar(context, "Could not launch $url", AppColor.redColor);
  }
}