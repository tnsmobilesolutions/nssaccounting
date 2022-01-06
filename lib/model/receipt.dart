// import 'dart:convert';

// class Receipt {
//   final String? accountCode;
//   final double? amount;
//   final String? devoteeId;
//   final String? paaliaName;
//   final bool? notMember;
//   final String? paymentMode;
//   final String? paymentType;
//   final String? preparedBy;
//   final String? receiptDate;
//   final String? receiptId;
//   final String? receiptNo;
//   final String? remarks;
//   final String? transactionRefNo;
//   Receipt({
//     this.accountCode,
//     this.amount,
//     this.devoteeId,
//     this.paaliaName,
//     this.notMember,
//     this.paymentMode,
//     this.paymentType,
//     this.preparedBy,
//     this.receiptDate,
//     this.receiptId,
//     this.receiptNo,
//     this.remarks,
//     this.transactionRefNo,
//   });

//   Receipt copyWith({
//     String? accountCode,
//     double? amount,
//     String? devoteeId,
//     String? paaliaName,
//     bool? notMember,
//     String? paymentMode,
//     String? paymentType,
//     String? preparedBy,
//     String? receiptDate,
//     String? receiptId,
//     String? receiptNo,
//     String? remarks,
//     String? transactionRefNo,
//   }) {
//     return Receipt(
//       accountCode: accountCode ?? this.accountCode,
//       amount: amount ?? this.amount,
//       devoteeId: devoteeId ?? this.devoteeId,
//       paaliaName: paaliaName ?? this.paaliaName,
//       notMember: notMember ?? this.notMember,
//       paymentMode: paymentMode ?? this.paymentMode,
//       paymentType: paymentType ?? this.paymentType,
//       preparedBy: preparedBy ?? this.preparedBy,
//       receiptDate: receiptDate ?? this.receiptDate,
//       receiptId: receiptId ?? this.receiptId,
//       receiptNo: receiptNo ?? this.receiptNo,
//       remarks: remarks ?? this.remarks,
//       transactionRefNo: transactionRefNo ?? this.transactionRefNo,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'accountCode': accountCode,
//       'amount': amount,
//       'devoteeId': devoteeId,
//       'paaliaName': paaliaName,
//       'notMember': notMember,
//       'paymentMode': paymentMode,
//       'paymentType': paymentType,
//       'preparedBy': preparedBy,
//       'receiptDate': receiptDate,
//       'receiptId': receiptId,
//       'receiptNo': receiptNo,
//       'remarks': remarks,
//       'transactionRefNo': transactionRefNo,
//     };
//   }

//   factory Receipt.fromMap(Map<String, dynamic> map) {
//     return Receipt(
//       accountCode: map['accountCode'],
//       amount: map['amount']?.toDouble(),
//       devoteeId: map['devoteeId'],
//       paaliaName: map['paaliaName'],
//       notMember: map['notMember'],
//       paymentMode: map['paymentMode'],
//       paymentType: map['paymentType'],
//       preparedBy: map['preparedBy'],
//       receiptDate: map['receiptDate'],
//       receiptId: map['receiptId'],
//       receiptNo: map['receiptNo'],
//       remarks: map['remarks'],
//       transactionRefNo: map['transactionRefNo'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Receipt.fromJson(String source) =>
//       Receipt.fromMap(json.decode(source));

//   @override
//   String toString() {
//     return 'Receipt(accountCode: $accountCode, amount: $amount, devoteeId: $devoteeId, paaliaName: $paaliaName, notMember: $notMember, paymentMode: $paymentMode, paymentType: $paymentType, preparedBy: $preparedBy, receiptDate: $receiptDate, receiptId: $receiptId, receiptNo: $receiptNo, remarks: $remarks, transactionRefNo: $transactionRefNo)';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;

//     return other is Receipt &&
//         other.accountCode == accountCode &&
//         other.amount == amount &&
//         other.devoteeId == devoteeId &&
//         other.paaliaName == paaliaName &&
//         other.notMember == notMember &&
//         other.paymentMode == paymentMode &&
//         other.paymentType == paymentType &&
//         other.preparedBy == preparedBy &&
//         other.receiptDate == receiptDate &&
//         other.receiptId == receiptId &&
//         other.receiptNo == receiptNo &&
//         other.remarks == remarks &&
//         other.transactionRefNo == transactionRefNo;
//   }

//   @override
//   int get hashCode {
//     return accountCode.hashCode ^
//         amount.hashCode ^
//         devoteeId.hashCode ^
//         paaliaName.hashCode ^
//         notMember.hashCode ^
//         paymentMode.hashCode ^
//         paymentType.hashCode ^
//         preparedBy.hashCode ^
//         receiptDate.hashCode ^
//         receiptId.hashCode ^
//         receiptNo.hashCode ^
//         remarks.hashCode ^
//         transactionRefNo.hashCode;
//   }
// }

import 'dart:convert';

class Receipt {
  final String? accountCode;
  final double? amount;
  final String? devoteeId;
  final String? paaliaName;
  final bool? notMember;
  final String? paymentMode;
  final String? paymentType;
  final String? preparedBy;
  final DateTime? receiptDate;
  final String? receiptId;
  final String? receiptNo;
  final String? remarks;
  final String? transactionRefNo;
  final String? paidBy;
  Receipt({
    this.accountCode,
    this.amount,
    this.devoteeId,
    this.paaliaName,
    this.notMember,
    this.paymentMode,
    this.paymentType,
    this.preparedBy,
    this.receiptDate,
    this.receiptId,
    this.receiptNo,
    this.remarks,
    this.transactionRefNo,
    this.paidBy,
  });

  Receipt copyWith({
    String? accountCode,
    double? amount,
    String? devoteeId,
    String? paaliaName,
    bool? notMember,
    String? paymentMode,
    String? paymentType,
    String? preparedBy,
    DateTime? receiptDate,
    String? receiptId,
    String? receiptNo,
    String? remarks,
    String? transactionRefNo,
    String? paidBy,
  }) {
    return Receipt(
      accountCode: accountCode ?? this.accountCode,
      amount: amount ?? this.amount,
      devoteeId: devoteeId ?? this.devoteeId,
      paaliaName: paaliaName ?? this.paaliaName,
      notMember: notMember ?? this.notMember,
      paymentMode: paymentMode ?? this.paymentMode,
      paymentType: paymentType ?? this.paymentType,
      preparedBy: preparedBy ?? this.preparedBy,
      receiptDate: receiptDate ?? this.receiptDate,
      receiptId: receiptId ?? this.receiptId,
      receiptNo: receiptNo ?? this.receiptNo,
      remarks: remarks ?? this.remarks,
      transactionRefNo: transactionRefNo ?? this.transactionRefNo,
      paidBy: paidBy ?? this.paidBy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountCode': accountCode,
      'amount': amount,
      'devoteeId': devoteeId,
      'paaliaName': paaliaName,
      'notMember': notMember,
      'paymentMode': paymentMode,
      'paymentType': paymentType,
      'preparedBy': preparedBy,
      'receiptDate': receiptDate?.millisecondsSinceEpoch,
      'receiptId': receiptId,
      'receiptNo': receiptNo,
      'remarks': remarks,
      'transactionRefNo': transactionRefNo,
      'paidBy': paidBy,
    };
  }

  factory Receipt.fromMap(Map<String, dynamic> map) {
    return Receipt(
      accountCode: map['accountCode'],
      amount: map['amount']?.toDouble(),
      devoteeId: map['devoteeId'],
      paaliaName: map['paaliaName'],
      notMember: map['notMember'],
      paymentMode: map['paymentMode'],
      paymentType: map['paymentType'],
      preparedBy: map['preparedBy'],
      //receiptDate: map['receiptDate'] != null
      // ? DateTime.fromMillisecondsSinceEpoch(map['receiptDate'])
      // : null,
      receiptId: map['receiptId'],
      receiptNo: map['receiptNo'],
      remarks: map['remarks'],
      transactionRefNo: map['transactionRefNo'],
      paidBy: map['paidBy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Receipt.fromJson(String source) =>
      Receipt.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Receipt(accountCode: $accountCode, amount: $amount, devoteeId: $devoteeId, paaliaName: $paaliaName, notMember: $notMember, paymentMode: $paymentMode, paymentType: $paymentType, preparedBy: $preparedBy, receiptDate: $receiptDate, receiptId: $receiptId, receiptNo: $receiptNo, remarks: $remarks, transactionRefNo: $transactionRefNo, paidBy: $paidBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Receipt &&
        other.accountCode == accountCode &&
        other.amount == amount &&
        other.devoteeId == devoteeId &&
        other.paaliaName == paaliaName &&
        other.notMember == notMember &&
        other.paymentMode == paymentMode &&
        other.paymentType == paymentType &&
        other.preparedBy == preparedBy &&
        other.receiptDate == receiptDate &&
        other.receiptId == receiptId &&
        other.receiptNo == receiptNo &&
        other.remarks == remarks &&
        other.transactionRefNo == transactionRefNo &&
        other.paidBy == paidBy;
  }

  @override
  int get hashCode {
    return accountCode.hashCode ^
        amount.hashCode ^
        devoteeId.hashCode ^
        paaliaName.hashCode ^
        notMember.hashCode ^
        paymentMode.hashCode ^
        paymentType.hashCode ^
        preparedBy.hashCode ^
        receiptDate.hashCode ^
        receiptId.hashCode ^
        receiptNo.hashCode ^
        remarks.hashCode ^
        transactionRefNo.hashCode ^
        paidBy.hashCode;
  }
}
