import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextflix/data/local/secure_storage_access.dart';

class SecureStorage implements SecureStorageAccess {
  final FlutterSecureStorage secureStorage;

  SecureStorage(this.secureStorage);

  @override
  Future<void> saveData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> readData(String key) async {
    return await secureStorage.read(key: key);
  }

  @override
  Future<void> deleteData(String key) async {
    await secureStorage.delete(key: key);
  }
}
