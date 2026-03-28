import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Persists whether the user has entered the app (guest or signed-in placeholder).
final sessionProvider = AsyncNotifierProvider<SessionNotifier, bool>(
  SessionNotifier.new,
);

class SessionNotifier extends AsyncNotifier<bool> {
  static const String _prefsKey = 'baseera.session_signed_in';

  @override
  Future<bool> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_prefsKey) ?? false;
  }

  Future<void> setSignedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_prefsKey, value);
    state = AsyncData<bool>(value);
  }

  Future<void> signOut() async {
    await setSignedIn(false);
  }
}
