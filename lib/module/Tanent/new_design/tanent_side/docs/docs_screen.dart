import 'package:flutter/material.dart';

import '../../../../../constant/reusable_text/reusable_text.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 143,
            width: MediaQuery.sizeOf(context).width * 0.50,
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                border: Border.all(color: const Color(0xff593D77)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the left (negative X offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the bottom (positive Y offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 100,
                  image: AssetImage('assets/images/docs/image 15.png'),
                ),
                ReusableText(
                  title: 'Bill',
                  size: 18,
                  weight: FontWeight.w500,
                  color: Color(0xff593D77),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 143,
            width: MediaQuery.sizeOf(context).width * 0.50,
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                border: Border.all(color: const Color(0xff593D77)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the left (negative X offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the bottom (positive Y offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 100,
                  image: AssetImage('assets/images/docs/image 13.png'),
                ),
                ReusableText(
                  title: 'Invoices',
                  size: 18,
                  weight: FontWeight.w500,
                  color: Color(0xff593D77),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 143,
            width: MediaQuery.sizeOf(context).width * 0.50,
            decoration: BoxDecoration(
                color: const Color(0xffFFFFFF),
                border: Border.all(color: const Color(0xff593D77)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the left (negative X offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                  BoxShadow(
                    offset: Offset(0, 4),
                    // Add a shadow to the bottom (positive Y offset)
                    blurRadius: 4,
                    // Adjust the blur radius as needed
                    color: Color(0x40252525), // 25% black shadow color
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: 100,
                  image: AssetImage('assets/images/docs/image-removebg-preview (11) 1.png'),
                ),
                ReusableText(
                  title: 'Agreements',
                  size: 18,
                  weight: FontWeight.w500,
                  color: Color(0xff593D77),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
