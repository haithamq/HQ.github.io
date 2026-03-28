import 'package:baseera/data/subscription_entity.dart';
import 'package:baseera/data/subscription_entity_mapper.dart';
import 'package:baseera/data/subscription_repository.dart';
import 'package:baseera/models/subscription.dart';
import 'package:isar/isar.dart';

class IsarSubscriptionRepository implements SubscriptionRepository {
  IsarSubscriptionRepository(this._isar);

  final Isar _isar;

  @override
  Future<List<Subscription>> load() async {
    final List<SubscriptionEntity> rows =
        await _isar.subscriptionEntitys.where().findAll();
    return rows.map(subscriptionFromEntity).toList();
  }

  @override
  Future<void> save(List<Subscription> items) async {
    await _isar.writeTxn(() async {
      await _isar.subscriptionEntitys.clear();
      for (final Subscription s in items) {
        await _isar.subscriptionEntitys.put(subscriptionToEntity(s));
      }
    });
  }
}
