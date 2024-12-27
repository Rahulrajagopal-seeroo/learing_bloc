import '../models/payment_data.dart';

class ChartData {
  static List<PaymentData> getChartData(String year) {
    switch (year) {
      case '2023':
        return [
          PaymentData('Jan', 4, 2),
          PaymentData('Feb', 2, 1),
          PaymentData('Mar', 5, 1),
          PaymentData('Apr', 3, 1),
          PaymentData('May', 2, 1),
          PaymentData('Jun', 2, 1),
          PaymentData('Jul', 2, 2),
          PaymentData('Aug', 3, 3),
          PaymentData('Sep', 1, 1),
          PaymentData('Oct', 6, 2),
          PaymentData('Nov', 3, 4),
          PaymentData('Dec', 6, 2),
        ];
      case '2024':
        return [
          PaymentData('Jan', 3, 1),
          PaymentData('Feb', 4, 2),
          PaymentData('Mar', 6, 3),
          PaymentData('Apr', 5, 2),
          PaymentData('May', 4, 1),
          PaymentData('Jun', 3, 2),
          PaymentData('Jul', 5, 1),
          PaymentData('Aug', 4, 2),
          PaymentData('Sep', 3, 3),
          PaymentData('Oct', 5, 1),
          PaymentData('Nov', 4, 2),
          PaymentData('Dec', 5, 1),
        ];
      case '2025':
        return [
          PaymentData('Jan', 5, 3),
          PaymentData('Feb', 6, 2),
          PaymentData('Mar', 4, 1),
          PaymentData('Apr', 7, 2),
          PaymentData('May', 5, 3),
          PaymentData('Jun', 6, 1),
          PaymentData('Jul', 4, 2),
          PaymentData('Aug', 5, 1),
          PaymentData('Sep', 6, 2),
          PaymentData('Oct', 4, 3),
          PaymentData('Nov', 5, 1),
          PaymentData('Dec', 7, 2),
        ];
      default:
        return [];
    }
  }
}
