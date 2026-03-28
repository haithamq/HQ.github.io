import 'package:baseera/data/prefs_subscription_repository.dart';
import 'package:baseera/data/subscription_repository.dart';

Future<SubscriptionRepository> createSubscriptionRepository() async {
  return PrefsSubscriptionRepository();
}
