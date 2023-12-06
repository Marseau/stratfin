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

class BirthdayContainer extends StatefulWidget {
  final double? width;
  final double? height;
  final String font;
  final double fontSize;
  final Color itemColor;
  final Color backgroundColor;
  final Function(DateTime) onUpdateDateBirthday; // Novo parâmetro
  final Function(int) onUpdateAge; // Novo parâmetro

  BirthdayContainer({
    Key? key,
    this.width,
    this.height,
    required this.font,
    required this.fontSize,
    required this.itemColor,
    required this.backgroundColor,
    required this.onUpdateDateBirthday, // Nova inicialização
    required this.onUpdateAge, // Nova inicialização
  }) : super(key: key);

  @override
  _BirthdayContainerState createState() => _BirthdayContainerState();
}

class _BirthdayContainerState extends State<BirthdayContainer> {
  DateTime? _selectedDate;
  int? _calculatedAge;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: widget.width,
          height: widget.height,
          child: BirthdayPicker(
            font: widget.font,
            fontSize: widget.fontSize,
            itemColor: widget.itemColor,
            backgroundColor: widget.backgroundColor,
            onDateAndAgeSelected: (DateTime? selectedDate, int? calculatedAge) {
              setState(() {
                _selectedDate = selectedDate;
                _calculatedAge = calculatedAge;
              });
              widget.onUpdateDateBirthday(selectedDate!);
              widget.onUpdateAge(calculatedAge!);
            },
          ),
        ),
        SizedBox(height: 20.0), // Espaçamento
        Text(
            "Data selecionada: ${_selectedDate?.toLocal().toString().split(' ')[0] ?? "Nenhuma"}"),
        Text("Idade calculada: ${_calculatedAge?.toString() ?? "Nenhuma"}")
      ],
    );
  }
}
