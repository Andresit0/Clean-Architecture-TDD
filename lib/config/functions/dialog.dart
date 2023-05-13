part of config.functions;

class CustomDialogFunc {
  isActive(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
}
