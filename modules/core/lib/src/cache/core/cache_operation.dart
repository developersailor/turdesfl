import 'package:core/core.dart';

/// An abstract class representing a cache operation for a specific type of
/// cache model. Classes that extend this abstract class should implement
/// the necessary methods to perform cache operations for the specified
/// type parameter [T].
///
/// [T] extends [CacheModel] to ensure that only valid cache models are
/// used with this operation.
abstract class CacheOperation<T extends CacheModel> {
  Future<void> add(T item);
  Future<void> addAll(List<T> items);
  Future<void> remove(String id);
  Future<void> clear();
  Future<List<T>> getAll(); // Needs Future<List<T>> due to async operations
  Future<T?> get(String id); // Change to Future<T?>
}
