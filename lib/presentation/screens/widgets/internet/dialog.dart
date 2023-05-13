part of presentation.screens;

class CustomInternetDialog {
  static customDialogShowedWhenNoInternet(BuildContext context) async {
    if (await CustomFunctions.internet.isActive() &&
        !CustomFunctions.dialog.isActive(context)) {
      CustomDialog.customDialogHeaderBodyFooter(
          context: context,
          colorHeaderBackground: Colors.white,
          title: const Text('No hay internet'),
          colorClose: Colors.black,
          body: Column(),
          footerButtons: [],
          dialogHeight: 200,
          dialogWidth: 100,
          onclose: () {});
    }
  }
}
