import 'dart:convert';

class Payment {
  final String? accountCode;
  final String? amount;
  final String? paymentDate;
  final String? paymentId;
  final String? voucherNo;
  Payment({
    this.accountCode,
    this.amount,
    this.paymentDate,
    this.paymentId,
    this.voucherNo,
  });

  Payment copyWith({
    String? accountCode,
    String? amount,
    String? paymentDate,
    String? paymentId,
    String? voucherNo,
  }) {
    return Payment(
      accountCode: accountCode ?? this.accountCode,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentId: paymentId ?? this.paymentId,
      voucherNo: voucherNo ?? this.voucherNo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountCode': accountCode,
      'amount': amount,
      'paymentDate': paymentDate,
      'paymentId': paymentId,
      'voucherNo': voucherNo,
    };
  }

  factory Payment.fromMap(Map<String, dynamic> map) {
    return Payment(
      accountCode: map['accountCode'] != null ? map['accountCode'] : null,
      amount: map['amount'] != null ? map['amount'] : null,
      paymentDate: map['paymentDate'] != null ? map['paymentDate'] : null,
      paymentId: map['paymentId'] != null ? map['paymentId'] : null,
      voucherNo: map['voucherNo'] != null ? map['voucherNo'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Payment.fromJson(String source) =>
      Payment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Payment(accountCode: $accountCode, amount: $amount, paymentDate: $paymentDate, paymentId: $paymentId, voucherNo: $voucherNo)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payment &&
        other.accountCode == accountCode &&
        other.amount == amount &&
        other.paymentDate == paymentDate &&
        other.paymentId == paymentId &&
        other.voucherNo == voucherNo;
  }

  @override
  int get hashCode {
    return accountCode.hashCode ^
        amount.hashCode ^
        paymentDate.hashCode ^
        paymentId.hashCode ^
        voucherNo.hashCode;
  }
}
