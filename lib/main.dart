import 'package:flutter/material.dart';
import 'package:flutter_transferencia/screens/transferencia/Lista.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent[700],
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Colors.blueAccent[700]),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      home: ListaTransferencias(),
    );
  }
}
