import 'dart:convert';

class Devotee {
  final String? branchId;
  final String? devoteeId;
  final String? devoteeName;
  Devotee({
    this.branchId,
    this.devoteeId,
    this.devoteeName,
  });

  Devotee copyWith({
    String? branchId,
    String? devoteeId,
    String? devoteeName,
  }) {
    return Devotee(
      branchId: branchId ?? this.branchId,
      devoteeId: devoteeId ?? this.devoteeId,
      devoteeName: devoteeName ?? this.devoteeName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'branchId': branchId,
      'devoteeId': devoteeId,
      'devoteeName': devoteeName,
    };
  }

  factory Devotee.fromMap(Map<String, dynamic> map) {
    return Devotee(
      branchId: map['branchId'] != null ? map['branchId'] : null,
      devoteeId: map['devoteeId'] != null ? map['devoteeId'] : null,
      devoteeName: map['devoteeName'] != null ? map['devoteeName'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Devotee.fromJson(String source) =>
      Devotee.fromMap(json.decode(source));

  @override
  String toString() =>
      'Devotee(branchId: $branchId, devoteeId: $devoteeId, devoteeName: $devoteeName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Devotee &&
        other.branchId == branchId &&
        other.devoteeId == devoteeId &&
        other.devoteeName == devoteeName;
  }

  @override
  int get hashCode =>
      branchId.hashCode ^ devoteeId.hashCode ^ devoteeName.hashCode;
}
