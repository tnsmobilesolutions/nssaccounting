import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nssaccounting/model/payment.dart';

class PaymentAPI {
  Future<String> createNewPayment(PaymentDatas payment) async {
    CollectionReference paymentCol =
        FirebaseFirestore.instance.collection('payments');
    final reference = await paymentCol.add({
      "voucherNo": payment.voucherNo,
      "paymentDate": payment.paymentDate,
      "accountHead": payment.accountHead,
      "partyName": payment.partyName,
      "amount": payment.amount,
      "paymentType": payment.paymentType,
      "paymentMode": payment.paymentMode,
      "transactinRefNo": payment.transactinRefNo,
      "preparedBy": payment.preparedBy,
      "authorizedBy": payment.authorizedBy,
      "remark": payment.remark,
    });
    return reference.id;
  }
}
