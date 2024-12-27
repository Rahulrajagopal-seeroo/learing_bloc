// import 'package:flutter/material.dart';
// import '../data/chart_data.dart';
// import '../models/payment_data.dart';

// class ChartController extends ChangeNotifier {
//   List<PaymentData> _chartData = [];
//   String _selectedYear = '2023';

//   ChartController() {
//     _chartData = ChartData.getChartData(_selectedYear);
//   }

//   List<PaymentData> get chartData => _chartData;
//   String get selectedYear => _selectedYear;

//   void updateChartData(String year) {
//     _selectedYear = year;
//     _chartData = ChartData.getChartData(year);
//     notifyListeners();
//   }
// }
