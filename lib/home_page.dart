
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_event.dart';
import 'bloc/home_state.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;    // Gives the width
    final double height = MediaQuery.of(context).size.height;
    return  BlocProvider(
      create: (_) => HomeBloc()..add(LoadItems()),
  child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((127/874)*height),
        child: Column(
          children: [
            SizedBox(height: (47/874)*height),
            AppBar(
              // backgroundColor: ,
              title: const Text('Home',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),),
            ),
          ],
        ),
      ),
      body: const Homepagecontent(),
    ),
);
  }
}



class Homepagecontent extends StatefulWidget {
  const Homepagecontent({super.key});

  @override
  State<Homepagecontent> createState() => _HomepagecontentState();
}

class _HomepagecontentState extends State<Homepagecontent> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String value) {
    context.read<HomeBloc>().add(SearchItems(value));
  }
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;    // Gives the width
    final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          margin: EdgeInsets.only(
              left: (20 / 390) * width,
              right: (20 / 390) * width
          ),
          height: (42/874)*height,
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            decoration: const InputDecoration(
              hintText: "Search by issuer Name or ISIN",
              hintStyle: TextStyle(fontSize: 12,color: Color(0XFF99A1AF)),
              prefixIcon: Icon(Icons.search, size: 16), // Better size
              contentPadding: EdgeInsets.symmetric(vertical: 12), // Aligns text & icon
            ),
          ),
        ),
        SizedBox(height: (20/874)*height,),
        Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
              child: const Text(
                'SUGGESTED RESULTS',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF99A1AF),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox( // ✅ Replace Expanded with fixed height
              height: 216, // Set a specific height based on your layout
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    if (state.items.isEmpty) {
                      return const Center(child: Text("No items found."));
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 72,
                          padding: EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              state.items[index],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 0),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
              // ListView.separated(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   itemCount: 8,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       height: 72,
              //       width: double.infinity,
              //       decoration: BoxDecoration(
              //         color: Color(0XFFFFFFFF),
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //       child: Center(child: Text('Item ${index + 1}')),
              //     );
              //   },
              //   separatorBuilder: (context, index) => const SizedBox(height: 0),
              // ),
            ),
          ],
        )

      ],
    );
  }
}

