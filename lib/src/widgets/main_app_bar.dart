import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';
import '../helpers/icon_helper.dart';
import '../helpers/utils.dart';
import 'icon_font.dart';
import 'user_profile_header.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  MainAppBar({Key? key,
    this.themeColor = AppColors.MAIN_COLOR,})
      : super(key: key);

  Color? themeColor;

  @override
  Size get preferredSize => new Size.fromHeight(80);

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Utils.mainAppNav.currentState
              ?.popUntil((route) => route.settings.name == '/mainpage');
        },
        child: IconFont(
          size: 40,
          color: widget.themeColor,
          iconName: IconFontHelper.LOGO,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: widget.themeColor),
      centerTitle: true,
      actions: [
        UserProfileHeader(),
      ],
    );
  }
}
