part of config.functions;

class CustomInternetFunc {
  Future<bool> isActive() async {
    return await Connectivity().checkConnectivity() == ConnectivityResult.none;
  }
}
