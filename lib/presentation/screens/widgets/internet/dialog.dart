// ignore_for_file: use_build_context_synchronously
part of presentation.screens;

class CustomInternetDialog {
  static bool showNoInternetDialog = false;
  static customDialogShowedWhenNoInternet(BuildContext context) async {
    if (!showNoInternetDialog) {
      showNoInternetDialog = await CustomFunctions.internet.isActive() &&
          !CustomFunctions.dialog.isActive(context);
    }
    if (showNoInternetDialog) {
      CustomDialog.customDialogHeaderBodyFooter(
          context: context,
          colorHeaderBackground: Colors.white,
          title: Text(localization.AppLocalizations.of(context)!.noInternet),
          colorClose: Colors.black,
          body: const Column(),
          footerButtons: [],
          dialogHeight: 200,
          dialogWidth: 100,
          onclose: () {});
    }
  }
}
