part of config.functions.packages;

class CustomRequest {
  get({
    required Uri uri,
    required BuildContext context,
    Map<String, String>? headers,
  }) async {
    try {
      var response = await http.get(uri);
      if (response.statusCode == 200) return jsonDecode(response.body);
      return RestError(
        context: context,
        exception: Exception('Error from server'),
        errorMessage: 'Error from server',
        stackTrace:
            'lib/infrastructure/datasources/criptocurrency_datasource_imp.dart',
        httpBodyResponse: response.body,
        httpPath: uri.toString(),
      );
      //400	BAD_REQUEST
      //401	UNAUTHORIZED
      //404	NOT_FOUND
      //500	INTERNAL_SERVER_ERROR
      //502	BAD_GATEWAY
    } catch (e, stackTrace) {
      if (kDebugMode) print(stackTrace);
      return RestError(
        context: context,
        exception: e,
        errorMessage: 'Error from server',
        stackTrace: stackTrace.toString(),
        httpBodyResponse: null,
        httpPath: uri.toString(),
      );
      //throw Exception('ERROR: $e');
    }
  }
}
