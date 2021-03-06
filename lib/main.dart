import 'package:bytebank_db/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
  // save(Contact(0, 'Paty', 1000));
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor: Colors.blueAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
