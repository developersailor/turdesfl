import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCacheOperation<T extends CacheModel> {
  SecureCacheOperation({required this.fromJson});
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final T Function(Map<String, dynamic>) fromJson;

  Future<void> add(String key, T item) async {
    await _secureStorage.write(key: key, value: jsonEncode(item.toJson()));
  }

  Future<void> addAll(Map<String, T> items) async {
    // Store each item with a corresponding key
    for (final entry in items.entries) {
      await _secureStorage.write(
        key: entry.key,
        value: jsonEncode(entry.value.toJson()),
      );
    }
  }

  Future<void> remove(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  Future<T?> get(String key) async {
    final value = await _secureStorage.read(key: key);
    if (value == null) {
      return null;
    }
    return fromJson(jsonDecode(value) as Map<String, dynamic>);
  }
}
