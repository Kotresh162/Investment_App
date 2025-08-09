import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'api/company_api.dart';
import 'card_detail.dart';
import 'cubit/comapny_cubit.dart';
import 'cubit/comapny_state.dart';


class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CompanyDetailCubit(CompanyRepository())..fetchCompanyDetail(),
      child: Scaffold(
        body: BlocBuilder<CompanyDetailCubit, CompanyDetailState>(
          builder: (context, state){
            if (state is CompanyDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CompanyDetailError) {
              return Center(child: Text("Error: ${state.message}"));
            } else if (state is CompanyDetailData) {
              // print(state.detail.companyName);
              final details = state.detail;
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
                          const SizedBox(height: 47),
                          // Same as your top padding
                          AppBar(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            automaticallyImplyLeading: false,
                            leading: CircleAvatar(
                              radius: 18,
                              child: IconButton(
                                icon: const Icon(
                                    Icons.arrow_back, color: Colors.black),
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
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20),
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
                              decoration: BoxDecoration(
                                // color: Colors.blue,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    details.logo,
                                  ),
                                  fit: BoxFit
                                      .cover, // or BoxFit.contain depending on need
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                             Text(
                              details.companyName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF101828),
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              details.description,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0x1F2563EB),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    details.isin,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0x14059669),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    details.status,
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
                    child: CardDetail(detail: details),
                  )
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}


