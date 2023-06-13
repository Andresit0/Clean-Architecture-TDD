part of config.functions;

class CustomRequestFunc {
  Map<String, String> basicHeaders = {};

  get({
    required Uri uri,
    required BuildContext context,
    Map<String, String>? headers,
  }) async {
    return await _request(
      method: 'get',
      uri: uri,
      context: context,
      headers: headers ?? basicHeaders,
    );
  }

  _request({
    required String method,
    required Uri uri,
    required BuildContext context,
    Map<String, String>? headers,
    List<http.MultipartFile>? files,
    Map<String, String>? fields,
  }) async {
    try {
      // ignore: prefer_typing_uninitialized_variables
      var response;
      if (files != null) {
        var request = http.MultipartRequest(method, uri);
        request.files.addAll(files);
        if (fields != null) request.fields.addAll(fields);
        response = await request.send();
      } else {
        switch (method) {
          case 'get':
            response = await http.get(uri);
            break;
          case 'post':
            response = await http.post(uri);
            break;
        }
      }

      if (method == 'file') {
        return jsonDecode(await response.stream.bytesToString());
      }
      if (response.statusCode == 200) return jsonDecode(response.body);
      return RestErrorEntity(
        context: context,
        exception: Exception('Error from server'),
        errorMessage: 'Error from server',
        stackTrace:
            'lib/infrastructure/datasources/criptocurrency_datasource_imp.dart',
        httpBodyResponse: response.body,
        httpPath: uri.toString(),
      );
    } catch (e, stackTrace) {
      if (kDebugMode) print(stackTrace);
      return RestErrorEntity(
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
