
import 'package:flutter/material.dart';

Widget buildCustomLayout(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 252,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
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
                    cardBuild("Issuer Name","Type of Issuer","Sector"),
                    cardBuild("Industry","Issuer nature","Corporate Identity Number (CIN)"),
                    cardBuild("Name of the Lead Manager","Registrar","Name of Debenture Trustee"),
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

Widget cardBuild(String text1, String text2, String text3) {
  return Container(
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
            Text(text1,style: TextStyle(
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
            Text(text2,style: TextStyle(
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
            Text(text3,style: TextStyle(
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