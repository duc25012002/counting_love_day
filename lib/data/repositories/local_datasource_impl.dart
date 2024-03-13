import '../../app/services/local_storage.dart';
import '../../app/util/static_string.dart';

abstract class LocalDataSource {
  // save data
  Future<void> saveUserEmail(String email);
  Future<void> saveToken(String token);

  // delete data
  Future<void> deleteUserEmail();
  Future<void> deleteToken();

  // get data
  Future<String?> getUserEmail();
  Future<String?> getToken();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalStorageService _localStorageService = LocalStorageService();
  final StaticString _staticString = StaticString();

  /// user in here
  @override
  Future<void> saveUserEmail(String email) async {
    _localStorageService = await LocalStorageService().init();
    await _localStorageService.saveData(_staticString.userName, email);
  }

  @override
  Future<String?> getUserEmail() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.getData(_staticString.userName);
  }

  @override
  Future<void> deleteUserEmail() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.deleteData(_staticString.userName);
  }

  /// token in here
  @override
  Future<void> saveToken(String token) async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.saveData(_staticString.token, token);
  }

  @override
  Future<String?> getToken() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.getData(_staticString.token);
  }

  @override
  Future<void> deleteToken() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.deleteData(_staticString.token);
  }
}
