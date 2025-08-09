import 'package:flutter/material.dart';
import '../models/company_details.dart';

Widget prosConsCard(BuildContext context, Points prosConsPoints) {
  return Container(
    width: 350,
    decoration: BoxDecoration(
      color: const Color(0XFFFFFFFF),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      border: Border.all(
        color: const Color(0XFFE5E7EB),
        width: 1,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Container(
          padding: const EdgeInsets.only(left: 20, right: 16, top: 16),
          height: 53,
          alignment: Alignment.centerLeft,
          child: const Text(
            "Pros and Cons",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0XFF020617),
            ),
          ),
        ),

        // Content
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              pointCard("Pros",prosConsPoints.pros),
              pointCard("Cons",prosConsPoints.cons)
            ],
          ),
        ),
      ],
    ),
  );
}

Widget pointCard(String title, List<String> points) {
  // Use direct icon URLs or local assets
  final String iconUrl = (title == "Pros")
      ? 'https://cdn-icons-png.flaticon.com/512/845/845646.png'
      : 'https://cdn-icons-png.flaticon.com/512/1828/1828665.png';

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: (title == "Pros")
              ? const Color(0XFF15803D) // green
              : const Color(0XFFB45309), // orange/brown
        ),
      ),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: points.length,
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 8,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(iconUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  points[index],
                  style:  TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      ),
    ],
  );
}