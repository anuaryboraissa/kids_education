import 'package:flutter/material.dart';

import '../constants/color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.leading,
      required this.title,
      required this.subtitle});
  final String leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppSettings.darkBlue
            : AppSettings.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppSettings.white
                      : AppSettings.darkBlue,
                  width: 2.0),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Center(child: Text(leading)),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                // const SizedBox(
                //   height: 5,
                // ),
                // LinearProgressIndicator(
                //   value: course.completedPercentage,
                //   backgroundColor: Colors.black12,
                //   color: kPrimaryColor,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
