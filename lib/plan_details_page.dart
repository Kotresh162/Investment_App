
import 'package:flutter/material.dart';

class PlanDetailsPage extends StatelessWidget {
  const PlanDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(123),
        child: Column(
          children: [
            SizedBox(height: 47),
            AppBar(
                leading: IconButton(onPressed: () {
                  print("back");
                }, icon: Icon(Icons.arrow_back))
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 209,
            padding: const EdgeInsets.only(top: 10,left: 20,right: 20),
            decoration: BoxDecoration(
              // color: Colors.red,
            ),
            child: Container(
              height: 197,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.green,
              ),
              child: Column(
                // mainAxisAlignment: ,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  Text("Hella Inframer",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF101828),
                    fontSize: 16,
                  ),),
                  Text("Hella Infra is a construction materials platform that enhances operational efficiency by integrating technology into the construction industry's value chain.",style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height:23,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Inner spacing
                        decoration: BoxDecoration(
                          color: const Color(0x1F2563EB), // 12% opacity of #2563EB
                          borderRadius: BorderRadius.circular(4), // 4px rounded corners
                        ),
                        child: const Text(
                          "ISIN: IEN0098098",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF2563EB),
                          ),
                        ),
                      ),
                      Container(
                        height:23,
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Inner spacing
                        decoration: BoxDecoration(
                          color: const Color(0x14059669), // 12% opacity of #2563EB
                          borderRadius: BorderRadius.circular(4), // 4px rounded corners
                        ),
                        child: const Text(
                          "Active",
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

          )
        ],
      ),
    );
  }
}
