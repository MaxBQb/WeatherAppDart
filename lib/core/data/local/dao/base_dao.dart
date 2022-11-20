import 'package:floor/floor.dart';

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insert(T model);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<int> update(T model);

  @delete
  Future<void> deleteModel(T model);

  @delete
  Future<int> deleteMultiple(List<T> models);
}
