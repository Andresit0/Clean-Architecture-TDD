part of presentation.screens;

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: CustomVariables.constColors.black,
      child: Text(text,
          style: CustomVariables.constLetterStyle.title, maxLines: 1),
    );
  }
}

class CustomLabelPrincipal extends StatelessWidget {
  final String text;
  const CustomLabelPrincipal({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
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
}

class CustomLabelSecundary extends StatelessWidget {
  final String text;
  const CustomLabelSecundary({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
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
}
