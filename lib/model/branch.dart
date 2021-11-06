import 'dart:convert';

class Branch {
  final String? branchId;
  final String? branchName;
  final String? address;
  Branch({
    this.branchId,
    this.branchName,
    this.address,
  });

  Branch copyWith({
    String? branchId,
    String? branchName,
    String? address,
  }) {
    return Branch(
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'branchId': branchId,
      'branchName': branchName,
      'address': address,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      branchId: map['branchId'] != null ? map['branchId'] : null,
      branchName: map['branchName'] != null ? map['branchName'] : null,
      address: map['address'] != null ? map['address'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));

  @override
  String toString() =>
      'Branch(branchId: $branchId, branchName: $branchName, address: $address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Branch &&
        other.branchId == branchId &&
        other.branchName == branchName &&
        other.address == address;
  }

  @override
  int get hashCode =>
      branchId.hashCode ^ branchName.hashCode ^ address.hashCode;
}
