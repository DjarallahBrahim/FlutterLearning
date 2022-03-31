import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patientsbook/pages/form_page.dart';
import 'package:patientsbook/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';
import 'controllers/menu_controller.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) {
    setWindowMinSize(const Size(1000, 1000));
  }
  runApp(const MyApp());
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
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => MenuController()),
          ],
          child: HomePage(),
        ),
        routes: {
          FormPage.routeName: (context) => FormPage(),
        });
  }
}
