import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/color.dart';
import '../constants/size.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData iconData;

  const DefaultButton(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.iconData})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: 100.w,
        height: SizerUtil.deviceType == DeviceType.tablet ? 9.h : 7.h,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [kOtherColor, kPrimaryColor],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(0.5, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
            borderRadius: BorderRadius.circular(kDefaultPadding)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(title, style: Theme.of(context).textTheme.subtitle2),
            const Spacer(),
            Icon(
              iconData,
              size: 26.sp,
              color: kOtherColor,
            )
          ],
        ),
      ),
    );
  }
}
