import 'dart:io';

import 'package:baseera/data/isar_schema_version.dart';
import 'package:baseera/data/subscription_entity.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsarService {
  IsarService._();

  static Isar? _isar;

  static const String _prefsSchemaKey = 'baseera.isar_schema_version';

  static Future<void> _deleteIsarFilesIn(Directory root) async {
    if (!await root.exists()) {
      return;
    }
    await for (final FileSystemEntity e in root.list()) {
      if (e is! File) {
        continue;
      }
      if (e.path.endsWith('.isar')) {
        try {
          await e.delete();
        } on Object {
          // Best-effort wipe; open() will retry or fail clearly.
        }
      }
    }
  }

  static Future<Isar> _open(Directory docDir) {
    return Isar.open(
      <CollectionSchema<dynamic>>[SubscriptionEntitySchema],
      directory: docDir.path,
    );
  }

  /// Opens Isar, wiping incompatible DB files when the schema version bumped
  /// or when open fails (corrupt / mismatched schema from an older build).
  static Future<Isar> instance() async {
    if (_isar != null) {
      return _isar!;
    }

    final Directory docDir = await getApplicationDocumentsDirectory();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int storedVersion = prefs.getInt(_prefsSchemaKey) ?? 0;

    Future<void> bumpVersionAndWipe() async {
      await _isar?.close(deleteFromDisk: true);
      _isar = null;
      await _deleteIsarFilesIn(docDir);
      await prefs.setInt(_prefsSchemaKey, kBaseeraIsarSchemaVersion);
    }

    if (storedVersion < kBaseeraIsarSchemaVersion) {
      await bumpVersionAndWipe();
    }

    try {
      _isar = await _open(docDir);
    } on Object {
      await bumpVersionAndWipe();
      _isar = await _open(docDir);
    }

    return _isar!;
  }

  /// Testing helper: close, delete on disk, clear schema version key.
  static Future<void> resetForTest() async {
    await _isar?.close(deleteFromDisk: true);
    _isar = null;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsSchemaKey);
  }
}
