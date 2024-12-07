import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nextflix/data/data_sources/secure_storage_data_source.dart';

class SecureStorage implements SecureStorageDataSource {
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
