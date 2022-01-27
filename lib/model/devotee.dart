import 'dart:convert';

class Devotee {
  final String? devoteeId;
  final String? devoteeName;
  final String? branchName;
  final String? ppid;
  final int? joiningYear;
  final String? contact;
  final String? email;
  Devotee({
    this.devoteeId,
    this.devoteeName,
    this.branchName,
    this.ppid,
    this.joiningYear,
    this.contact,
    this.email,
  });

  Devotee copyWith({
    String? devoteeId,
    String? devoteeName,
    String? branchName,
    String? ppid,
    int? joiningYear,
    String? contact,
    String? email,
  }) {
    return Devotee(
      devoteeId: devoteeId ?? this.devoteeId,
      devoteeName: devoteeName ?? this.devoteeName,
      branchName: branchName ?? this.branchName,
      ppid: ppid ?? this.ppid,
      joiningYear: joiningYear ?? this.joiningYear,
      contact: contact ?? this.contact,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'devoteeId': devoteeId,
      'devoteeName': devoteeName,
      'branchName': branchName,
      'ppid': ppid,
      'joiningYear': joiningYear,
      'contact': contact,
      'email': email,
    };
  }

  factory Devotee.fromMap(Map<String, dynamic> map) {
    return Devotee(
      devoteeId: map['devoteeId'],
      devoteeName: map['devoteeName'],
      branchName: map['branchName'],
      ppid: map['ppid'],
      joiningYear: map['joiningYear']?.toInt(),
      contact: map['contact'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Devotee.fromJson(String source) =>
      Devotee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Devotee(devoteeId: $devoteeId, devoteeName: $devoteeName, branchName: $branchName, ppid: $ppid, joiningYear: $joiningYear, contact: $contact, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Devotee &&
        other.devoteeId == devoteeId &&
        other.devoteeName == devoteeName &&
        other.branchName == branchName &&
        other.ppid == ppid &&
        other.joiningYear == joiningYear &&
        other.contact == contact &&
        other.email == email;
  }

  @override
  int get hashCode {
    return devoteeId.hashCode ^
        devoteeName.hashCode ^
        branchName.hashCode ^
        ppid.hashCode ^
        joiningYear.hashCode ^
        contact.hashCode ^
        email.hashCode;
  }
}
