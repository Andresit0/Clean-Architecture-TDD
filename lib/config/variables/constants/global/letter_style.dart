part of config.variables;

class CustomConstLetterStyle {
  TextStyle tableBody = TextStyle(
    fontFamily: 'Hind',
    color: CustomVariables.constColors.black,
    fontSize: CustomVariables.constLetterSize.tableBody,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w200,
  );
  TextStyle subtitle = TextStyle(
    fontFamily: 'Hind',
    color: CustomVariables.constColors.black,
    fontSize: CustomVariables.constLetterSize.subtitle,
    letterSpacing: 0.4,
    fontWeight: FontWeight.w400,
  );
  TextStyle title = TextStyle(
    fontFamily: 'Hind',
    color: CustomVariables.constColors.white,
    fontSize: CustomVariables.constLetterSize.title,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w600,
  );
}
