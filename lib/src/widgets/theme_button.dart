import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../helpers/app_colors.dart';

class ThemeButton extends StatelessWidget {
  ThemeButton(
      {Key? key,
      this.label,
      required this.onClick,
      this.color = AppColors.MAIN_COLOR,
      this.borderColor = Colors.transparent,
      this.labelColor = Colors.white,
      this.highlight = AppColors.HIGHILIGHT_DEFAULT,
      this.icon,
      this.buttonWidth,
      this.topMargin: 20,
      this.bottomMargin: 20,
      this.borderWidth = 8})
      : super(key: key);

  String? label;
  Function onClick;
  Color? color, borderColor, labelColor, highlight;
  Widget? icon;
  double? borderWidth, buttonWidth;
  double topMargin, bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 20, right: 20, bottom: this.bottomMargin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: this.color,
          child: InkWell(
            splashColor: this.highlight,
            highlightColor: this.highlight,
            onTap: () {
              this.onClick();
            },
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: this.icon == null
                  ? Text(
                      this.label.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        this.icon!,
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          this.label.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              color: this.labelColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                  border: Border.all(
                    color: this.borderColor!,
                    width: 4,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
