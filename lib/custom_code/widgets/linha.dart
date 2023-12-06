// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class Linha extends StatefulWidget {
  const Linha({
    Key? key,
    this.width,
    this.height,
    this.cor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? cor;

  @override
  _LinhaState createState() => _LinhaState();
}

class _LinhaState extends State<Linha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.widget.height,
      width: this.widget.width,
      color: this.widget.cor,
    );
  }
}
