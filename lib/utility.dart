enum Payment { cash, bank }
enum PaymentType { online, cheque, dd }

class Utility {
  static String getPaymentModeString(Payment? paymentMode) {
    switch (paymentMode) {
      case Payment.bank:
        return "Bank";
      case Payment.cash:
        return "Cash";
      default:
        return "Cash";
    }
  }

  static String getPaymentTypeString(PaymentType? paymentType) {
    switch (paymentType) {
      case PaymentType.cheque:
        return "Cheque";
      case PaymentType.dd:
        return "DD";
      case PaymentType.online:
        return "Online";
      default:
        return "Online";
    }
  }

  static String getReceiptNo() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
