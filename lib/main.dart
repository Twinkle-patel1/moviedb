import 'dart:io';
import 'package:movie_db/app.dart';
import 'package:movie_db/data_source/network/certificate_overrides.dart';
import 'package:movie_db/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  await initialise();
  runApp(
    const MyApp(),
  );
}

Future initialise() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = HttpCertificateOverrides();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
