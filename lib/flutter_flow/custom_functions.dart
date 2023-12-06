import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int calculateAgeNew(DateTime dateToCheck) {
  return DateTime.now().year - dateToCheck.year;
}

bool validateEmail(String email) {
  // email validation bool return
  if (email.isEmpty) {
    return false;
  }
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

List<String> searchIgnoreCase(
  String fieldin,
  List<String> items,
) {
  return items
      .where((item) => item.toLowerCase() == fieldin.toLowerCase())
      .toList();
}

bool searchFieldResult(
  String textSearchFor,
  String textSearchIn,
) {
  return textSearchIn.toLowerCase().contains(textSearchFor.toLowerCase());
}

String? getCurrentUserId() {
  // get current user ID
// TODO: Implement getCurrentUserId function
  return currentUserReference?.id;
}
