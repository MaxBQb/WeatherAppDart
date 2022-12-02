// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DBBuilder databaseBuilder(String name) => _$DBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DBBuilder inMemoryDatabaseBuilder() => _$DBBuilder(null);
}

class _$DBBuilder {
  _$DBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DB extends DB {
  _$DB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocationDao? _locationDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `LocationEntity` (`id` INTEGER NOT NULL, `latitude` REAL NOT NULL, `longitude` REAL NOT NULL, `name` TEXT, `country` TEXT, `timezone` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocationDao get locationDao {
    return _locationDaoInstance ??= _$LocationDao(database, changeListener);
  }
}

class _$LocationDao extends LocationDao {
  _$LocationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _locationEntityInsertionAdapter = InsertionAdapter(
            database,
            'LocationEntity',
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'name': item.name,
                  'country': item.country,
                  'timezone': item.timezone
                }),
        _locationEntityUpdateAdapter = UpdateAdapter(
            database,
            'LocationEntity',
            ['id'],
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'name': item.name,
                  'country': item.country,
                  'timezone': item.timezone
                }),
        _locationEntityDeletionAdapter = DeletionAdapter(
            database,
            'LocationEntity',
            ['id'],
            (LocationEntity item) => <String, Object?>{
                  'id': item.id,
                  'latitude': item.latitude,
                  'longitude': item.longitude,
                  'name': item.name,
                  'country': item.country,
                  'timezone': item.timezone
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LocationEntity> _locationEntityInsertionAdapter;

  final UpdateAdapter<LocationEntity> _locationEntityUpdateAdapter;

  final DeletionAdapter<LocationEntity> _locationEntityDeletionAdapter;

  @override
  Future<LocationEntity?> getLocation() async {
    return _queryAdapter.query('SELECT * FROM LocationEntity LIMIT 1',
        mapper: (Map<String, Object?> row) => LocationEntity(
            latitude: row['latitude'] as double,
            longitude: row['longitude'] as double,
            timezone: row['timezone'] as String?,
            name: row['name'] as String?,
            country: row['country'] as String?));
  }

  @override
  Future<int> insert(LocationEntity model) {
    return _locationEntityInsertionAdapter.insertAndReturnId(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<int> update(LocationEntity model) {
    return _locationEntityUpdateAdapter.updateAndReturnChangedRows(
        model, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteModel(LocationEntity model) async {
    await _locationEntityDeletionAdapter.delete(model);
  }

  @override
  Future<int> deleteMultiple(List<LocationEntity> models) {
    return _locationEntityDeletionAdapter
        .deleteListAndReturnChangedRows(models);
  }
}
