import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/chart_data.dart';
import '../../../models/payment_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<LoadHomeData>(_onLoadHomeData);
    on<ChangeYear>(_onChangeYear);
  }

  void _onLoadHomeData(LoadHomeData event, Emitter<HomeState> emit) {
    final chartData = ChartData.getChartData('2023');
    emit(HomeLoaded(selectedYear: '2023', chartData: chartData));
  }

  void _onChangeYear(ChangeYear event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final chartData = ChartData.getChartData(event.year);
      emit(HomeLoaded(selectedYear: event.year, chartData: chartData));
    }
  }
}