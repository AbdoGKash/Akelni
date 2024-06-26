import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper/language/app_localizations.dart';
import 'package:flutter_application_1/core/theming/colors.dart';
import 'package:flutter_application_1/core/theming/text_styel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/helper/app_strings.dart';
import '../../../../core/routing/routers_name.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.hiAbdo.tr(context),
              style: TextStyles.font24BlackBold,
            ),
            Text(
              AppStrings.howAreYou.tr(context),
              style: TextStyles.font14Gray200,
            )
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutersName.favoriteScreen);
          },
          child: CircleAvatar(
            backgroundColor: ColorsManager.ligtherGrey,
            radius: 25,
            child: Icon(
              Icons.favorite,
              color: ColorsManager.primary,
            ),
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutersName.cartScreen);
          },
          child: CircleAvatar(
            backgroundColor: ColorsManager.ligtherGrey,
            radius: 25,
            child: Icon(
              FontAwesomeIcons.cartShopping,
              color: ColorsManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
