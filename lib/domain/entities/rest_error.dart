part of domain.entities;

class RestError {
  int? responseCode;
  final BuildContext context;
  final String httpPath;
  final String? httpBodyResponse;
  final String errorMessage;
  final String stackTrace;
  final Object exception;
  RestError({
    required this.context,
    required this.exception,
    required this.errorMessage,
    required this.stackTrace,
    required this.httpPath,
    required this.httpBodyResponse,
  }) {
    if (kDebugMode) {
      debugPrint('''\n
        Http Path: $httpPath
        Body Response: $httpBodyResponse
        Error: $errorMessage
        StacTrace: $stackTrace
      ''');
    }
    if (!CustomDialog.errorDialogIsShowed) {
      CustomDialog.errorDialogIsShowed = true;
      CustomDialog.customDialogHeaderBodyFooter(
          context: context,
          colorHeaderBackground: CustomVariables.constColors.black,
          title: const Text('ERROR'),
          colorClose: CustomVariables.constColors.white,
          body: Center(
            child: Text('message: $messageToShow'),
          ),
          footerButtons: [],
          dialogHeight: 200,
          dialogWidth: 200,
          onclose: () {
            CustomDialog.errorDialogIsShowed = false;
          });
    }
  }

  String get messageToShow {
    String message =
        'Hemos tenido un problema, lo resolveremos los más pronto posible';
    if (responseCode != null) {
      switch (responseCode) {
        case 404:
          message = 'Intenta más tarde por favor';
      }
    } else {
      switch (exception) {
        case HttpException:
          break;
      }
    }

    return message;
  }
}
