import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientsbook/common/app_colors.dart';
import 'package:patientsbook/models/patients.dart';
import 'package:patientsbook/pages/form_page.dart';
import 'package:patientsbook/pages/home_page.dart';
import 'package:patientsbook/pages/patientDetail_page.dart';
import 'package:provider/provider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:window_size/window_size.dart';
import 'controllers/menu_controller.dart';
import 'dart:io';

import 'helpers/Sizeconfig.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowMinSize(const Size(1000, 1000));
  }
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MenuController()),
        ChangeNotifierProvider(create: (context) => Patients()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('en', ''), Locale('fr', '')],
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            scrollbarTheme: ScrollbarThemeData(
                isAlwaysShown: true,
                thickness: MaterialStateProperty.all(4),
                thumbColor: MaterialStateProperty.all(AppColor.blue),
                radius: const Radius.circular(10),
                minThumbLength: 50)),
        home: SplashScreenView(
          navigateRoute: HomePage(),
          duration: 4000,
          imageSize: 512,

          imageSrc: "assets/logo.png",
          // text: "PAtient Book Screen",
          // textType: TextType.ColorizeAnimationText,
          textStyle: TextStyle(
            fontSize: 40.0,
          ),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          backgroundColor: Colors.white,
        ),
        // home: HomePage(),
        routes: {
          FormPage.routeName: (context) => FormPage(),
          PatientDetailPage.routeName: (context) => PatientDetailPage(),
        });
  }
}
