import 'package:flutter/material.dart';

class SuggestedItemCard extends StatelessWidget {
  final String text;

  const SuggestedItemCard({super.key, required this.text});

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
        children: [
          Row(
            spacing: 10,
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
                child: const CircleAvatar(
                  radius: 20, // 40 - 2*border = 36 → radius = 18
                  backgroundImage: NetworkImage('https://cdn.brandfetch.io/idVluv2fZa/w/200/h/200/theme/dark/icon.jpeg?c=1dxbfHSJFAPEGdCLU4o5B'),
                  ),
                ),
              Column(
                // spacing: 2,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: [
                        TextSpan(text: text.substring(0, text.length - 4),style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.5),
                          letterSpacing: 1,
                        )),
                        TextSpan(
                          text: text.substring(text.length - 4),
                          style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 10, color: Colors.black),
                      children: [
                        const TextSpan(text: "4.5 "), // rating
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Icon(Icons.circle, size: 4, color: Colors.black54),
                          ),
                        ),
                        const TextSpan(text: "Excellent"), // text after the dot
                      ],
                    ),
                  )
                ],
              )
            ],
          ),

        ],
      ),
    );
  }
}
