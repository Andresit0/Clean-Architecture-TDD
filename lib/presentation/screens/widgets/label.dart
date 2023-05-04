import 'package:flutter/material.dart';

import '../../../config/variables/variable.lib.dart';

Widget header({required String text}) {
  return Container(
    alignment: Alignment.center,
    color: CustomVariables.constColors.black,
    child:
        Text(text, style: CustomVariables.constLetterStyle.title, maxLines: 1),
  );
}

Widget labelPrincipal({required String text}) {
  return Expanded(
    child: Container(
      color: CustomVariables.constColors.black,
      padding: EdgeInsets.symmetric(
          horizontal: CustomVariables.constPadding.smallPadding),
      child: Text(
        text,
        style: CustomVariables.constLetterStyle.subtitle
            .copyWith(color: CustomVariables.constColors.white),
        maxLines: 1,
      ),
    ),
  );
}

Widget labelSecundary({required String text}) {
  return Expanded(
    child: Container(
      color: CustomVariables.constColors.gray4,
      padding: EdgeInsets.symmetric(
          horizontal: CustomVariables.constPadding.smallPadding),
      child: Text(text,
          style: CustomVariables.constLetterStyle.tableBody, maxLines: 1),
    ),
  );
}
