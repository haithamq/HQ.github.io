/// Default four household slots (names empty until user fills them).
const List<FamilyMember> kDefaultFamilyMemberSlots = <FamilyMember>[
  FamilyMember(id: '1', name: '', monthlyShare: 0),
  FamilyMember(id: '2', name: '', monthlyShare: 0),
  FamilyMember(id: '3', name: '', monthlyShare: 0),
  FamilyMember(id: '4', name: '', monthlyShare: 0),
];

class FamilyMember {
  const FamilyMember({
    required this.id,
    required this.name,
    required this.monthlyShare,
  });

  final String id;
  final String name;
  final double monthlyShare;

  FamilyMember copyWith({
    String? id,
    String? name,
    double? monthlyShare,
  }) {
    return FamilyMember(
      id: id ?? this.id,
      name: name ?? this.name,
      monthlyShare: monthlyShare ?? this.monthlyShare,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'share': monthlyShare,
    };
  }

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      monthlyShare: (json['share'] as num?)?.toDouble() ?? 0,
    );
  }
}
