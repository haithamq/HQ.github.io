import 'dart:convert';

import 'package:baseera/models/family_member.dart'
    show FamilyMember, kDefaultFamilyMemberSlots;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final familyWorkspaceProvider =
    AsyncNotifierProvider<FamilyWorkspaceNotifier, List<FamilyMember>>(
  FamilyWorkspaceNotifier.new,
);

class FamilyWorkspaceNotifier extends AsyncNotifier<List<FamilyMember>> {
  static const String _prefsKey = 'baseera.family_members.v1';

  @override
  Future<List<FamilyMember>> build() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? raw = prefs.getString(_prefsKey);
    if (raw == null || raw.isEmpty) {
      return List<FamilyMember>.from(kDefaultFamilyMemberSlots);
    }
    try {
      final List<dynamic> list = jsonDecode(raw) as List<dynamic>;
      final List<FamilyMember> parsed = list
          .map((dynamic e) => FamilyMember.fromJson(e as Map<String, dynamic>))
          .toList();
      if (parsed.length >= 4) {
        return parsed.take(4).toList();
      }
    } on Object {
      // ignore
    }
    return List<FamilyMember>.from(kDefaultFamilyMemberSlots);
  }

  Future<void> _persist(List<FamilyMember> members) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encoded =
        jsonEncode(members.map((FamilyMember e) => e.toJson()).toList());
    await prefs.setString(_prefsKey, encoded);
  }

  Future<void> replaceAll(List<FamilyMember> members) async {
    final List<FamilyMember> next = members.take(4).toList();
    await _persist(next);
    state = AsyncData<List<FamilyMember>>(next);
  }

  Future<void> updateMember(FamilyMember updated) async {
    final List<FamilyMember> current = state.requireValue;
    final List<FamilyMember> next = <FamilyMember>[
      for (final FamilyMember m in current)
        if (m.id == updated.id) updated else m,
    ];
    await _persist(next);
    state = AsyncData<List<FamilyMember>>(next);
  }
}
