import 'package:baseera/data/subscription_repository.dart';
import 'package:baseera/models/subscription.dart';
import 'package:baseera/notifications/renewal_reminder_backend.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Overridden in [main] after storage is opened.
final subscriptionRepositoryProvider = Provider<SubscriptionRepository>(
  (Ref ref) => throw UnimplementedError(
    'subscriptionRepositoryProvider must be overridden after bootstrap',
  ),
);

/// Overridden in [main] with [LiveRenewalReminderBackend] on native platforms.
final renewalReminderBackendProvider = Provider<RenewalReminderBackend>(
  (Ref ref) => throw UnimplementedError(
    'renewalReminderBackendProvider must be overridden after bootstrap',
  ),
);

final subscriptionsProvider =
    AsyncNotifierProvider<SubscriptionsNotifier, List<Subscription>>(
  SubscriptionsNotifier.new,
);

class SubscriptionsNotifier extends AsyncNotifier<List<Subscription>> {
  SubscriptionRepository get _repo => ref.read(subscriptionRepositoryProvider);
  RenewalReminderBackend get _reminders => ref.read(renewalReminderBackendProvider);

  @override
  Future<List<Subscription>> build() async {
    final List<Subscription> list = await _repo.load();
    await _reminders.resync(list);
    return list;
  }

  Future<void> upsert(Subscription subscription) async {
    final List<Subscription> current = state.requireValue;
    final int index = current.indexWhere((Subscription s) => s.id == subscription.id);
    final List<Subscription> next = index < 0
        ? <Subscription>[...current, subscription]
        : <Subscription>[
            for (int i = 0; i < current.length; i++)
              if (i == index) subscription else current[i],
          ];
    await _repo.save(next);
    state = AsyncData<List<Subscription>>(next);
    await _reminders.resync(next);
  }

  Future<void> remove(String id) async {
    final List<Subscription> current = state.requireValue;
    final List<Subscription> next =
        current.where((Subscription s) => s.id != id).toList();
    await _repo.save(next);
    state = AsyncData<List<Subscription>>(next);
    await _reminders.resync(next);
  }
}
