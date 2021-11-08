import 'dart:convert';

class Payment {
  final String? voucherNo;
  final String? paymentDate;
  final String? accountHead;
  final String? partyName;
  final String? amount;
  final String? paymentType;
  final String? paymentMode;
  final String? transactinRefNo;
  final String? preparedBy;
  final String? authorizedBy;
  final String? remark;
  Payment({
    this.voucherNo,
    this.paymentDate,
    this.accountHead,
    this.partyName,
    this.amount,
    this.paymentType,
    this.paymentMode,
    this.transactinRefNo,
    this.preparedBy,
    this.authorizedBy,
    this.remark,
  });

  Payment copyWith({
    String? voucherNo,
    String? paymentDate,
    String? accountHead,
    String? partyName,
    String? amount,
    String? paymentType,
    String? paymentMode,
    String? transactinRefNo,
    String? preparedBy,
    String? authorizedBy,
    String? remark,
  }) {
    return Payment(
      voucherNo: voucherNo ?? this.voucherNo,
      paymentDate: paymentDate ?? this.paymentDate,
      accountHead: accountHead ?? this.accountHead,
      partyName: partyName ?? this.partyName,
      amount: amount ?? this.amount,
      paymentType: paymentType ?? this.paymentType,
      paymentMode: paymentMode ?? this.paymentMode,
      transactinRefNo: transactinRefNo ?? this.transactinRefNo,
      preparedBy: preparedBy ?? this.preparedBy,
      authorizedBy: authorizedBy ?? this.authorizedBy,
      remark: remark ?? this.remark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'voucherNo': voucherNo,
      'paymentDate': paymentDate,
      'accountHead': accountHead,
      'partyName': partyName,
      'amount': amount,
      'paymentType': paymentType,
      'paymentMode': paymentMode,
      'transactinRefNo': transactinRefNo,
      'preparedBy': preparedBy,
      'authorizedBy': authorizedBy,
      'remark': remark,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      voucherNo: map['voucherNo'] != null ? map['voucherNo'] : null,
      paymentDate: map['paymentDate'] != null ? map['paymentDate'] : null,
      accountHead: map['accountHead'] != null ? map['accountHead'] : null,
      partyName: map['partyName'] != null ? map['partyName'] : null,
      amount: map['amount'] != null ? map['amount'] : null,
      paymentType: map['paymentType'] != null ? map['paymentType'] : null,
      paymentMode: map['paymentMode'] != null ? map['paymentMode'] : null,
      transactinRefNo:
          map['transactinRefNo'] != null ? map['transactinRefNo'] : null,
      preparedBy: map['preparedBy'] != null ? map['preparedBy'] : null,
      authorizedBy: map['authorizedBy'] != null ? map['authorizedBy'] : null,
      remark: map['remark'] != null ? map['remark'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(voucherNo: $voucherNo, paymentDate: $paymentDate, accountHead: $accountHead, partyName: $partyName, amount: $amount, paymentType: $paymentType, paymentMode: $paymentMode, transactinRefNo: $transactinRefNo, preparedBy: $preparedBy, authorizedBy: $authorizedBy, remark: $remark)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payment &&
        other.voucherNo == voucherNo &&
        other.paymentDate == paymentDate &&
        other.accountHead == accountHead &&
        other.partyName == partyName &&
        other.amount == amount &&
        other.paymentType == paymentType &&
        other.paymentMode == paymentMode &&
        other.transactinRefNo == transactinRefNo &&
        other.preparedBy == preparedBy &&
        other.authorizedBy == authorizedBy &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return voucherNo.hashCode ^
        paymentDate.hashCode ^
        accountHead.hashCode ^
        partyName.hashCode ^
        amount.hashCode ^
        paymentType.hashCode ^
        paymentMode.hashCode ^
        transactinRefNo.hashCode ^
        preparedBy.hashCode ^
        authorizedBy.hashCode ^
        remark.hashCode;
  }
}
