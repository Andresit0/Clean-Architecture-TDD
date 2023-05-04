part of functions.packages;

class CustomRequest {
  get({required Uri uri, Map<String, String>? headers}) async {
    try {
      //! No Internet Connection
      // throw SocketException('No Internet');
      //! 404
      // throw HttpException('404');
      //! Invalid JSON (throws FormatException)
      // return 'abcd';
      var response = await http.get(uri);
      if (response.statusCode == 200) return jsonDecode(response.body);
      //400	BAD_REQUEST
      //401	UNAUTHORIZED
      //404	NOT_FOUND
      //500	INTERNAL_SERVER_ERROR
      //502	BAD_GATEWAY
    } catch (e, stacktrace) {
      if (kDebugMode) print(stacktrace);
      return '';
      //throw Exception('ERROR: $e');
    }
  }
}
