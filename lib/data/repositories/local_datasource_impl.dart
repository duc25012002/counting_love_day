import '../../app/services/local_storage.dart';
import '../../app/util/static_string.dart';

abstract class LocalDataSource {
  Future<void> saveUserEmail(String email);
  Future<dynamic> getUserEmail();
  Future<void> deleteUserEmail();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalStorageService _localStorageService = LocalStorageService();
  final StaticString _staticString = StaticString();
  @override
  Future<void> saveUserEmail(String email) async {
    _localStorageService = await LocalStorageService().init();
    await _localStorageService.saveData(_staticString.userName, email);
  }

  @override
  Future<dynamic> getUserEmail() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.getData(_staticString.userName);
  }

  @override
  Future<void> deleteUserEmail() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.deleteData(_staticString.userName);
  }
}
