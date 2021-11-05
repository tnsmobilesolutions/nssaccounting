import 'dart:convert';

class AppUser {
  final String? devoteeId;
  final String? email;
  final String? name;
  final String? role;
  final String? sangha;
  final String? uid;
  final String? userId;
  AppUser({
    this.devoteeId,
    this.email,
    this.name,
    this.role,
    this.sangha,
    this.uid,
    this.userId,
  });

  AppUser copyWith({
    String? devoteeId,
    String? email,
    String? name,
    String? role,
    String? sangha,
    String? uid,
    String? userId,
  }) {
    return AppUser(
      devoteeId: devoteeId ?? this.devoteeId,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      sangha: sangha ?? this.sangha,
      uid: uid ?? this.uid,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'devoteeId': devoteeId,
      'email': email,
      'name': name,
      'role': role,
      'sangha': sangha,
      'uid': uid,
      'userId': userId,
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      devoteeId: map['devoteeId'] != null ? map['devoteeId'] : null,
      email: map['email'] != null ? map['email'] : null,
      name: map['name'] != null ? map['name'] : null,
      role: map['role'] != null ? map['role'] : null,
      sangha: map['sangha'] != null ? map['sangha'] : null,
      uid: map['uid'] != null ? map['uid'] : null,
      userId: map['userId'] != null ? map['userId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(devoteeId: $devoteeId, email: $email, name: $name, role: $role, sangha: $sangha, uid: $uid, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppUser &&
        other.devoteeId == devoteeId &&
        other.email == email &&
        other.name == name &&
        other.role == role &&
        other.sangha == sangha &&
        other.uid == uid &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return devoteeId.hashCode ^
        email.hashCode ^
        name.hashCode ^
        role.hashCode ^
        sangha.hashCode ^
        uid.hashCode ^
        userId.hashCode;
  }
}
