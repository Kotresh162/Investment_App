import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/widgets/plan_details.dart';
import 'package:untitled/widgets/pros_cons_card.dart';
import '../models/company_details.dart';

enum SelectedTab { details, prosCons }

class TabCubit extends Cubit<SelectedTab> {
  TabCubit() : super(SelectedTab.details);

  void selectTab(SelectedTab tab) => emit(tab);
}


class CardDetail extends StatelessWidget {
  final CompanyDetail detail;

  const CardDetail({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabCubit(),
      child: BlocBuilder<TabCubit, SelectedTab>(
        builder: (context, selectedTab) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildTabButton(context, "ISIN Analysis",
                          SelectedTab.details, selectedTab),
                      const SizedBox(width: 24),
                      _buildTabButton(context, "Pros & Cons",
                          SelectedTab.prosCons, selectedTab),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _buildTabContent(context, selectedTab,detail),
              ],
            ),
          );
        },
      ),
    );
  }
}


  Widget _buildTabButton(BuildContext context, String label, SelectedTab tab, SelectedTab selected) {
    final isSelected = tab == selected;
    return GestureDetector(
      onTap: () => context.read<TabCubit>().selectTab(tab),
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          // color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Colors.blue : Colors.grey.shade300,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isSelected ? Color(0XFF1447E6) : Color(0XFF4A5565),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context,SelectedTab tab,CompanyDetail details) {
    switch (tab) {
      case SelectedTab.details:
        return buildCustomLayout(context,details.issuerDetails,details.financials);
      case SelectedTab.prosCons:
        return prosConsCard(context,details.prosAndCons);
    }
  }

