import 'package:nextflix/data/local/secure_storage_access.dart';
import 'package:nextflix/utils/env/env_config.dart';

class SecureStorageDataSource {
  final SecureStorageAccess secureStorage;
  SecureStorageDataSource(this.secureStorage);

  Future<void> saveToken(String accessToken, String refreshToken) async {
    await secureStorage.saveData(EnvConfig.accessTokenKey, accessToken);
    await secureStorage.saveData(EnvConfig.refreshToken, refreshToken);
  }
}
