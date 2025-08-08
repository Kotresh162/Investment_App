import 'package:flutter/material.dart';
import '../models/company_model.dart';

class SuggestedItemCard extends StatelessWidget {
  final Company cmp;

  const SuggestedItemCard({super.key, required this.cmp});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20, // 40 - 2*border = 36 → radius = 18
                  backgroundImage: NetworkImage(cmp.logo),
                  ),
                ),
              Column(
                spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: cmp.isin.substring(0, cmp.isin.length - 4),style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5),
                          letterSpacing: 1,
                        )),
                        TextSpan(
                          text: cmp.isin.substring(cmp.isin.length - 4),
                          style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                      children: [
                        TextSpan(text: cmp.rating), // rating
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(Icons.circle, size: 4, color: Colors.black54),
                          ),
                        ),
                        TextSpan(text: cmp.companyName), // text after the dot
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              print("done");
            },
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
    );
  }
}
