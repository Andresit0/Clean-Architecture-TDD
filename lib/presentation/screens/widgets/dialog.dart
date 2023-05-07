part of presentation.screens;

class CustomDialog {
  static bool errorDialogIsShowed = false;
  static Widget customDialogHeader(
      BuildContext context, Widget title, Color colorClose, Function? onclose) {
    return StatefulBuilder(builder: (context, setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(padding: EdgeInsets.only(left: 15)),
          Expanded(
            child: title,
          ),
          Container(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                Icons.cancel_outlined,
                color: colorClose,
              ),
              onPressed: () {
                if (onclose != null) onclose();
                Navigator.of(context).pop(true);
              },
            ),
          ),
        ],
      );
    });
  }

  static Widget customBodyInf(
      double dialogHeight, double dialogWidth, Widget body) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: dialogHeight,
      width: dialogWidth,
      child: body,
    );
  }

  static void customDialogHeaderBodyFooter({
    required BuildContext context,
    required Color colorHeaderBackground,
    required Widget title,
    required Color colorClose,
    required Widget body,
    required List<Widget> footerButtons,
    required double dialogHeight,
    required double dialogWidth,
    Function? onclose,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: const EdgeInsets.all(0),
              actionsPadding: const EdgeInsets.all(0),
              titlePadding: const EdgeInsets.all(0),
              buttonPadding: const EdgeInsets.all(0),
              insetPadding: const EdgeInsets.all(0),
              title: Container(
                color: colorHeaderBackground,
                child: customDialogHeader(context, title, colorClose, onclose),
              ),
              content: Builder(
                builder: (context) {
                  return customBodyInf(dialogHeight, dialogWidth, body);
                },
              ),
              actions: footerButtons,
            );
          });
        });
  }
}
