part of config.functions.packages;

class CustomRequest {
  Map<String, String> basicHeaders = {};

  get({
    required Uri uri,
    required BuildContext context,
    Map<String, String>? headers,
  }) async {
    return await request(
      method: 'get',
      uri: uri,
      context: context,
      headers: headers ?? basicHeaders,
    );
  }

  request({
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
      return RestError(
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
