import 'dart:convert';

//import 'package:intl/intl.dart';

class Branch {
  final String? branchId;
  final String? branchName;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final int? pin;
  final int? devotees;
  final int? year;

  var get;
  Branch({
    this.branchId,
    this.branchName,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pin,
    this.devotees,
    this.year,
  });

  Branch copyWith({
    String? branchId,
    String? branchName,
    String? address,
    String? city,
    String? state,
    String? country,
    int? pin,
    int? devotees,
    int? year,
  }) {
    return Branch(
      branchId: branchId ?? this.branchId,
      branchName: branchName ?? this.branchName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      pin: pin ?? this.pin,
      devotees: devotees ?? this.devotees,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'branchId': branchId,
      'branchName': branchName,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'pin': pin,
      'devotees': devotees,
      'year': year,
    };
  }

  factory Branch.fromMap(Map<String, dynamic> map) {
    return Branch(
      branchId: map['branchId'],
      branchName: map['branchName'],
      address: map['address'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      pin: map['pin']?.toInt(),
      devotees: map['devotees']?.toInt(),
      year: map['year']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Branch(branchId: $branchId, branchName: $branchName, address: $address, city: $city, state: $state, country: $country, pin: $pin, devotees: $devotees, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Branch &&
        other.branchId == branchId &&
        other.branchName == branchName &&
        other.address == address &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.pin == pin &&
        other.devotees == devotees &&
        other.year == year;
  }

  @override
  int get hashCode {
    return branchId.hashCode ^
        branchName.hashCode ^
        address.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        pin.hashCode ^
        devotees.hashCode ^
        year.hashCode;
  }
}


// import 'dart:convert';

// class Branch {
//   final String? branchId;
//   final String? branchName;
//   final String? address;
//   Branch({
//     this.branchId,
//     this.branchName,
//     this.address,
//   });

//   Branch copyWith({
//     String? branchId,
//     String? branchName,
//     String? address,
//   }) {
//     return Branch(
//       branchId: branchId ?? this.branchId,
//       branchName: branchName ?? this.branchName,
//       address: address ?? this.address,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'branchId': branchId,
//       'branchName': branchName,
//       'address': address,
//     };
//   }

//   factory Branch.fromMap(Map<String, dynamic> map) {
//     return Branch(
//       branchId: map['branchId'] != null ? map['branchId'] : null,
//       branchName: map['branchName'] != null ? map['branchName'] : null,
//       address: map['address'] != null ? map['address'] : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Branch.fromJson(String source) => Branch.fromMap(json.decode(source));

//   @override
//   String toString() =>
//       'Branch(branchId: $branchId, branchName: $branchName, address: $address)';

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Branch &&
//         other.branchId == branchId &&
//         other.branchName == branchName &&
//         other.address == address;
//   }

//   @override
//   int get hashCode =>
//       branchId.hashCode ^ branchName.hashCode ^ address.hashCode;
// }
