import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahul_bloc_login/features/home/bloc/home_bloc.dart';
import 'package:rahul_bloc_login/features/home/widgets/legend_item.dart';
import 'package:rahul_bloc_login/constants/app_sizes.dart';
import 'package:rahul_bloc_login/constants/app_colors.dart';
import 'package:rahul_bloc_login/constants/app_strings.dart';

class HomeView extends StatelessWidget {
  final HomeLoaded state;
  const HomeView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Column(
        children: [
          const SizedBox(height: AppSizes.smallPadding),
          SizedBox(
            height: 300,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.padding),
              ),
              elevation: AppSizes.cardElevation,
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          AppStrings.outstandingPayments,
                          style: TextStyle(fontSize: AppSizes.titleFontSize),
                        ),
                        const SizedBox(width: AppSizes.legendSpacing),
                        const Text(
                          AppStrings.year,
                          style: TextStyle(fontSize: AppSizes.yearFontSize),
                        ),
                        DropdownButton<String>(
                          value: state.selectedYear,
                          items: ['2023', '2024', '2025']
                              .map((year) => DropdownMenuItem<String>(
                                    value: year,
                                    child: Text(year),
                                  ))
                              .toList(),
                          onChanged: (newValue) {
                            if (newValue != null) {
                              context.read<HomeBloc>().add(ChangeYear(year: newValue));
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.smallPadding),
                    const Text(
                      AppStrings.amountAED,
                      style: TextStyle(
                        fontSize: AppSizes.amountFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.padding),
                    Expanded(
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 10,
                          barGroups: state.chartData.asMap().entries.map((entry) {
                            return BarChartGroupData(
                              x: entry.key,
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value.collectedAmount +
                                      entry.value.pendingAmount,
                                  width: AppSizes.barWidth,
                                  rodStackItems: [
                                    BarChartRodStackItem(
                                      0,
                                      entry.value.pendingAmount,
                                      AppColors.pendingAmount,
                                    ),
                                    BarChartRodStackItem(
                                      entry.value.pendingAmount,
                                      entry.value.pendingAmount +
                                          entry.value.collectedAmount,
                                      AppColors.collectedAmount,
                                    ),
                                  ],
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(AppSizes.smallPadding),
                                    topRight: Radius.circular(AppSizes.smallPadding),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: AppSizes.smallPadding),
                                    child: Text(
                                      state.chartData[value.toInt()].month,
                                      style: const TextStyle(fontSize: AppSizes.legendFontSize),
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: const FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: AppSizes.smallPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LegendItem(
                            label: AppStrings.collectedAmountLabel,
                            color: AppColors.collectedAmount,
                          ),
                          SizedBox(width: AppSizes.legendSpacing),
                          LegendItem(
                            label: AppStrings.pendingAmountLabel,
                            color: AppColors.pendingAmount,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
