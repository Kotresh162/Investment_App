import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/widgets/plan_details.dart';

enum SelectedTab { details, prosCons }

class TabCubit extends Cubit<SelectedTab> {
  TabCubit() : super(SelectedTab.details);

  void selectTab(SelectedTab tab) => emit(tab);
}

class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => TabCubit(),
      child: Scaffold(
        body: BlocBuilder<TabCubit, SelectedTab>(
          builder: (context, selectedTab){
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  snap: false,
                  expandedHeight: 123,
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        const SizedBox(height: 47), // Same as your top padding
                        AppBar(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          automaticallyImplyLeading: false,
                          leading: Container(
                            height: 36,
                            width: 36,
                            margin: const EdgeInsets.only(left: 8),
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.rectangle,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {
                                print("back");
                              },
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    decoration: const BoxDecoration(),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              // color: Colors.blue,
                              image: const DecorationImage(
                                image: NetworkImage(
                                  'https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B',
                                ),
                                fit: BoxFit.cover, // or BoxFit.contain depending on need
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Hella Inframer",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF101828),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            "Hella Infra is a construction materials platform that enhances operational efficiency by integrating technology into the construction industry's value chain.",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                height: 23,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0x1F2563EB),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "ISIN: IEN0098098",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFF2563EB),
                                    letterSpacing: 0.96,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 23,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0x14059669),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Text(
                                  "ACTIVE",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0XFF059669),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 24,
                            children: [
                              _buildTabButton(context, "ISIN Analysis", SelectedTab.details, selectedTab),
                              _buildTabButton(context, "Pros & Cons", SelectedTab.prosCons, selectedTab),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildTabContent(context,selectedTab),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
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

Widget _buildTabContent(BuildContext context,SelectedTab tab) {
  switch (tab) {
    case SelectedTab.details:
      return buildCustomLayout(context);
    case SelectedTab.prosCons:
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pros:\n- Fast\n- Efficient"),
          SizedBox(height: 8),
          Text("Cons:\n- Expensive\n- Complex"),
        ],
      );
  }
}


