import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:core/src/cache/core/cache_model.dart';

import 'package:core/core.dart';

class SecureCacheManager extends CacheManager {
  SecureCacheManager({super.path});
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> init({
    required List<CacheModel> items,
  }) async {
    for (final item in items) {
      try {
        // Generate a unique key for each item (for example, use a hash or a unique field)
        final key = item
            .toString(); // Replace this with a more meaningful unique key if necessary
        await _secureStorage.write(
          key: key, // Use the generated key
          value: jsonEncode(item.toJson()),
        );
      } catch (e) {
        print('Error writing to secure storage: $e');
      }
    }
  }

  @override
  Future<void> remove() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      print('Error clearing secure storage: $e');
    }
  }

  Future<void> removeByKey(String key) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      print('Error deleting key $key from secure storage: $e');
    }
  }

  Future<String?> read(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      print('Error reading key $key from secure storage: $e');
      return null;
    }
  }

  Future<void> write(String key, String value) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      print('Error writing key $key to secure storage: $e');
    }
  }
}
