import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

class ColorUtils {
  static Color uidToColor(String uid) {
    final bytes = utf8.encode(uid);
    final digest = md5.convert(bytes).toString();
    final hex = digest.substring(0, 6);
    return Color(int.parse('0xFF$hex'));
  }
}
