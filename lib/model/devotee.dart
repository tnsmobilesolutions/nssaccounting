import 'dart:convert';

class Devotee {
  final String? branchId;
  final String? devoteeName;
  final String? branchName;
  final String? ppid;
  final double? joiningYear;
  final double? contact;
  final String? email;
  Devotee({
    this.branchId,
    this.devoteeName,
    this.branchName,
    this.ppid,
    this.joiningYear,
    this.contact,
    this.email,
  });

  Devotee copyWith({
    String? branchId,
    String? devoteeName,
    String? branchName,
    String? ppid,
    double? joiningYear,
    double? contact,
    String? email,
  }) {
    return Devotee(
      branchId: branchId ?? this.branchId,
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
      'branchId': branchId,
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
      branchId: map['branchId'],
      devoteeName: map['devoteeName'],
      branchName: map['branchName'],
      ppid: map['ppid'],
      joiningYear: map['joiningYear']?.toDouble(),
      contact: map['contact']?.toDouble(),
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Devotee.fromJson(String source) =>
      Devotee.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Devotee(branchId: $branchId, devoteeName: $devoteeName, branchName: $branchName, ppid: $ppid, joiningYear: $joiningYear, contact: $contact, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Devotee &&
        other.branchId == branchId &&
        other.devoteeName == devoteeName &&
        other.branchName == branchName &&
        other.ppid == ppid &&
        other.joiningYear == joiningYear &&
        other.contact == contact &&
        other.email == email;
  }

  @override
  int get hashCode {
    return branchId.hashCode ^
        devoteeName.hashCode ^
        branchName.hashCode ^
        ppid.hashCode ^
        joiningYear.hashCode ^
        contact.hashCode ^
        email.hashCode;
  }
}




// import 'dart:convert';

// class Devotee {
//   final String? branchId;
//   final String? devoteeId;
//   final String? devoteeName;
//   Devotee({
//     this.branchId,
//     this.devoteeId,
//     this.devoteeName,
//   });

//   Devotee copyWith({
//     String? branchId,
//     String? devoteeId,
//     String? devoteeName,
//   }) {
//     return Devotee(
//       branchId: branchId ?? this.branchId,
//       devoteeId: devoteeId ?? this.devoteeId,
//       devoteeName: devoteeName ?? this.devoteeName,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'branchId': branchId,
//       'devoteeId': devoteeId,
//       'devoteeName': devoteeName,
//     };
//   }

//   factory Devotee.fromMap(Map<String, dynamic> map) {
//     return Devotee(
//       branchId: map['branchId'] != null ? map['branchId'] : null,
//       devoteeId: map['devoteeId'] != null ? map['devoteeId'] : null,
//       devoteeName: map['devoteeName'] != null ? map['devoteeName'] : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Devotee.fromJson(String source) =>
//       Devotee.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Devotee(branchId: $branchId, devoteeId: $devoteeId, devoteeName: $devoteeName)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Devotee &&
//         other.branchId == branchId &&
//         other.devoteeId == devoteeId &&
//         other.devoteeName == devoteeName;
//   }

//   @override
//   int get hashCode =>
//       branchId.hashCode ^ devoteeId.hashCode ^ devoteeName.hashCode;
// }
