import 'package:books_app/constants.dart';
import 'package:books_app/core/utiles/app_router.dart';
 import 'package:flutter/material.dart';
 import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooksApp());
}

class BooksApp extends StatelessWidget {
  const BooksApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPackgroundColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRoutes.route,
    );
  }
}
