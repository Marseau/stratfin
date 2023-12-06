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

class BirthdayPicker extends StatefulWidget {
  const BirthdayPicker({
    Key? key,
    this.width,
    this.height,
    required this.font,
    required this.fontSize,
    required this.itemColor,
    required this.backgroundColor,
    required this.onDateAndAgeSelected, // Adicionado o required aqui
  }) : super(key: key);

  final double? width;
  final double? height;
  final String font;
  final double fontSize;
  final Color itemColor;
  final Color backgroundColor;
  final Function(DateTime?, int?)
      onDateAndAgeSelected; // Modificado o tipo aqui

  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  int? day;
  int? month;
  int? year;
  DateTime? selectedDate;
  int? age;

  List<DropdownMenuItem<int>> get dayItems => List.generate(
      31,
      (index) =>
          DropdownMenuItem(value: index + 1, child: Text('${index + 1}')));

  List<DropdownMenuItem<int>> get monthItems {
    List<String> monthNames = [
      'janeiro',
      'fevereiro',
      'março',
      'abril',
      'maio',
      'junho',
      'julho',
      'agosto',
      'setembro',
      'outubro',
      'novembro',
      'dezembro'
    ];
    return List.generate(
        12,
        (index) =>
            DropdownMenuItem(value: index + 1, child: Text(monthNames[index])));
  }

  List<DropdownMenuItem<int>> get yearItems {
    int currentYear = DateTime.now().year;
    return List.generate(
        currentYear - 1900,
        (index) => DropdownMenuItem(
            value: currentYear - index, child: Text('${currentYear - index}')));
  }

  void _updateDate() {
    if (day != null && month != null && year != null) {
      setState(() {
        selectedDate = DateTime(year!, month!, day!);
        age = _calculateAge(selectedDate);
        widget.onDateAndAgeSelected(
            selectedDate, age); // Adicionada a chamada ao callback aqui
      });
    }
  }

  int _calculateAge(DateTime? birthDate) {
    if (birthDate == null) return 0;
    int age = DateTime.now().year - birthDate.year;
    if (DateTime.now().month < birthDate.month ||
        (DateTime.now().month == birthDate.month &&
            DateTime.now().day < birthDate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Alinha os elementos à direita
        children: [
          Expanded(
              child:
                  Container()), // Espaço vazio para empurrar os dropdowns para a direita
          _buildDropdown(dayItems, day, 'dia', (newValue) {
            setState(() {
              day = newValue;
              _updateDate();
            });
          }),
          _buildDropdown(monthItems, month, 'mês', (newValue) {
            setState(() {
              month = newValue;
              _updateDate();
            });
          }),
          _buildDropdown(yearItems, year, 'ano', (newValue) {
            setState(() {
              year = newValue;
              _updateDate();
            });
          }),
        ],
      ),
    );
  }

  DropdownButton<int> _buildDropdown(List<DropdownMenuItem<int>> items,
      int? value, String hint, Function(int?) onChanged) {
    return DropdownButton<int>(
      value: value,
      hint: Text(hint,
          style: TextStyle(
              color: widget.itemColor,
              fontFamily: widget.font,
              fontSize: widget.fontSize)),
      items: items,
      dropdownColor: widget.backgroundColor,
      style: TextStyle(
          color: widget.itemColor,
          fontFamily: widget.font,
          fontSize: widget.fontSize),
      underline: Container(
        height: 1,
        color: widget.itemColor,
      ),
      onChanged: onChanged,
      iconEnabledColor: widget.itemColor,
    );
  }
}
