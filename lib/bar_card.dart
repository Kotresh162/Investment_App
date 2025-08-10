import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/company_details.dart';
import 'package:untitled/widgets/bar_chart.dart';

enum FinanceTab { ebitda, revenue }

class FinanceCubit extends Cubit<FinanceTab> {
  FinanceCubit() : super(FinanceTab.ebitda);

  void finSelectTab(FinanceTab tab) => emit(tab);
}

Widget barCard(Financial finDetails) {
  return BlocProvider(
    create: (_) => FinanceCubit(),
    child: Container(
      height: 252,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: BlocBuilder<FinanceCubit, FinanceTab>(
        builder: (context, finSelectTab) {
          return Column(
            children: [
              Container(
                height: 57,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("COMPANY FINANCIALS", style: TextStyle(
                        color: Color(0XFFA3A3A3),
                        fontSize: 10,
                        fontWeight: FontWeight.w600
                    ),
                    ),
                    Container(
                      height: 25,
                      width: 110,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Color(0XFFE5E5E5),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Row(
                        children: [
                          _buildFinanceTabButton(context,"EBITDA",FinanceTab.ebitda,finSelectTab),
                          _buildFinanceTabButton(context,"Revenue",FinanceTab.revenue,finSelectTab),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildFinTabContent(context,finSelectTab,finDetails)
            ],
          );
        },
      ),
    ),
  );
}


Widget _buildFinanceTabButton(BuildContext context, String label, FinanceTab tab, FinanceTab selected) {
  final isSelected = tab == selected;
  return GestureDetector(
    onTap: () => context.read<FinanceCubit>().finSelectTab(tab),
    child: Container(
      height: 21,
      width: 53,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0XFF171717) : Color(0XFF737373),
          ),
        ),
      ),
    ),
  );
}

Widget _buildFinTabContent(BuildContext context,FinanceTab tab, Financial finDetails) {
  switch (tab) {
    case FinanceTab.ebitda:
      // return buildChart(context,finDetails.ebitda,3);
      return buildChart();
    case FinanceTab.revenue:
      // return buildChart(context,finDetails.revenue,3);
      // return buildChart();
      return Container(
        height: 194,
      );
  }
}