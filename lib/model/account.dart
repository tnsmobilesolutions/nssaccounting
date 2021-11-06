import 'dart:convert';

class Account {
  final String? accountCode;
  final String? accountId;
  final String? accountName;
  final String? accountType;
  Account({
    this.accountCode,
    this.accountId,
    this.accountName,
    this.accountType,
  });

  Account copyWith({
    String? accountCode,
    String? accountId,
    String? accountName,
    String? accountType,
  }) {
    return Account(
      accountCode: accountCode ?? this.accountCode,
      accountId: accountId ?? this.accountId,
      accountName: accountName ?? this.accountName,
      accountType: accountType ?? this.accountType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountCode': accountCode,
      'accountId': accountId,
      'accountName': accountName,
      'accountType': accountType,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      accountCode: map['accountCode'] != null ? map['accountCode'] : null,
      accountId: map['accountId'] != null ? map['accountId'] : null,
      accountName: map['accountName'] != null ? map['accountName'] : null,
      accountType: map['accountType'] != null ? map['accountType'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) =>
      Account.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Account(accountCode: $accountCode, accountId: $accountId, accountName: $accountName, accountType: $accountType)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Account &&
        other.accountCode == accountCode &&
        other.accountId == accountId &&
        other.accountName == accountName &&
        other.accountType == accountType;
  }

  @override
  int get hashCode {
    return accountCode.hashCode ^
        accountId.hashCode ^
        accountName.hashCode ^
        accountType.hashCode;
  }
}
