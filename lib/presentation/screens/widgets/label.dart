import 'package:flutter/material.dart';

import '../../../config/constants/global/colors.dart';
import '../../../config/constants/global/letter_style.dart';
import '../../../config/constants/global/padding.dart';

Widget header({required String text}) {
  return Container(
    alignment: Alignment.center,
    color: CustomColor.black,
    child: Text(text, style: LetterStyle.title, maxLines: 1),
  );
}

Widget labelPrincipal({required String text}) {
  return Expanded(
    child: Container(
      color: CustomColor.black,
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.smallPadding),
      child: Text(
        text,
        style: LetterStyle.subtitle.copyWith(color: CustomColor.white),
        maxLines: 1,
      ),
    ),
  );
}

Widget labelSecundary({required String text}) {
  return Expanded(
    child: Container(
      color: CustomColor.gray4,
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.smallPadding),
      child: Text(text, style: LetterStyle.tableBody, maxLines: 1),
    ),
  );
}
