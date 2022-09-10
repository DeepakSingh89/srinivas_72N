import 'package:get_storage/get_storage.dart';

class LocalStorageKeys {
  static const KEY_TOKEN = "token";
  static const KEY_MOBILE = "mobile";
  static const KEY_ADDRESS = "address";
}

class LocalStorage {
  static final GetStorage _storage = GetStorage();

  static saveToken(String token) {
    _storage.write(LocalStorageKeys.KEY_TOKEN, token);
  }

  static String readToken() {
    return _storage.read(LocalStorageKeys.KEY_TOKEN) ?? "";
  }

  static saveMobileNo(String mobileno) {
    _storage.write(LocalStorageKeys.KEY_MOBILE, mobileno);
  }

  static String readMobileNo() {
    return _storage.read(LocalStorageKeys.KEY_MOBILE) ?? "";
  }

  static saveAddress(String address) {
    _storage.write(LocalStorageKeys.KEY_ADDRESS, address);
  }

  static String readAddress() {
    return _storage.read(LocalStorageKeys.KEY_ADDRESS) ?? "";
  }
}
