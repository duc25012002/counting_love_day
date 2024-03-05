import '../../app/services/local_storage.dart';

abstract class LocalDataSource {
  Future<void> saveUserEmail(String email);
  Future<dynamic> getUserEmail();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalStorageService _localStorageService = LocalStorageService();

  @override
  Future<void> saveUserEmail(String email) async {
    _localStorageService = await LocalStorageService().init();
    await _localStorageService.saveData('user_email', email);
  }

  @override
  Future<dynamic> getUserEmail() async {
    _localStorageService = await LocalStorageService().init();
    return _localStorageService.getData('user_email');
  }
}
