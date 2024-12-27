part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final String selectedYear;
  final List<PaymentData> chartData;

  HomeLoaded({
    required this.selectedYear,
    required this.chartData,
  });
}

class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}

// lib/features/home/models/payment_data.dart
class PaymentData {
  final String month;
  final double collectedAmount;
  final double pendingAmount;

  PaymentData(this.month, this.collectedAmount, this.pendingAmount);
}