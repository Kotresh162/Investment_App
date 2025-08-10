
import 'package:flutter/material.dart';
import 'package:untitled/models/company_details.dart';

import '../bar_card.dart';


Widget buildCustomLayout(BuildContext context,IssuerDetails insDetails,Financial finDetails) {
  return Container(
  padding: const EdgeInsets.all(16),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      barCard(finDetails),
      const SizedBox(height: 24),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(
                color: Color(0XFFE5E7EB),
                width: 1
            )
        ),
        child: Column(
          children: [
            Container(
              height: 53,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0XFFE5E7EB),
                      width: 1
                  ),
              ),
              padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Row(
                spacing: 10,
                children: [
                  const Image(
                    image: NetworkImage(
                      'https://img.icons8.com/?size=100&id=93437&format=png&color=000000',
                    ),
                    width: 24,
                    height: 24,
                  ),
                  Text("Issuer Details",style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 28,horizontal: 16),
              child: Column(
                spacing: 32,
                children: [
                  cardBuild("Issuer Name","Type of Issuer","Sector",insDetails.issuerName,insDetails.typeOfIssuer,insDetails.sector),
                  cardBuild("Industry","Issuer nature","Corporate Identity Number (CIN)",insDetails.industry,insDetails.issuerNature,insDetails.cin),
                  cardBuild("Name of the Lead Manager","Registrar","Name of Debenture Trustee",insDetails.leadManager,insDetails.registrar,insDetails.debentureTrustee),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  ),
    );
}

Widget cardBuild(String text1, String text2, String text3,String ans1,String ans2,String ans3) {
  return SizedBox(
    height: 195,
    width: 310,
    child: Column(
      spacing: 27,
      crossAxisAlignment: CrossAxisAlignment.start, // Align to left
      children: [
        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start, // Align to left
          children: [
            Text(text1,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Color(0XFF1D4ED8)
            ),),
            Text(ans1,style: TextStyle(
              color: Color(0XFF111827),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start, // Align to left
          children: [
            Text(text2,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0XFF1D4ED8)
            ),),
            Text(ans2,style: TextStyle(
              color: Color(0XFF111827),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
        Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start, // Align to left
          children: [
            Text(text3,style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color(0XFF1D4ED8)
            ),),
            Text(ans3,style: TextStyle(
              color: Color(0XFF111827),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ],
    ),
  );
}
