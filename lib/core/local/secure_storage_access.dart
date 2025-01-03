abstract class SecureStorageAccess {
  Future<void> saveData(String key, String value);
  Future<String?> readData(String key);
  Future<void> deleteData(String key);
}