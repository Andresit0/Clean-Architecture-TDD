import 'package:flutter/material.dart';

import 'colors.dart';
import 'letter_size.dart';

class LetterStyle {
  static const tableBody = TextStyle(
    fontFamily: 'Hind',
    color: CustomColor.black,
    fontSize: CustomLetterSize.tableBody,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w200,
  );
  static const subtitle = TextStyle(
    fontFamily: 'Hind',
    color: CustomColor.black,
    fontSize: CustomLetterSize.subtitle,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );
  static const title = TextStyle(
    fontFamily: 'Hind',
    color: CustomColor.white,
    fontSize: CustomLetterSize.title,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w600,
  );
}
